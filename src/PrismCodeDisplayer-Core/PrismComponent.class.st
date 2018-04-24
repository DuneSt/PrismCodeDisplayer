"
I am a component that display source code.
Tell me what language you are using and I will display it.
Give me a block to get your text so I will transmit it to the browser with ajax to speed up the displaying.
"
Class {
	#name : #PrismComponent,
	#superclass : #WAComponent,
	#instVars : [
		'id',
		'sourceCode',
		'strategies',
		'intervals',
		'language',
		'menusWithAction',
		'jsOnLoadHook',
		'jsOnChangeHook',
		'startCountNumber',
		'lastIndexLoad',
		'sourceCodeCache',
		'lineCountCache',
		'cacheSortedObjectWithIntervals'
	],
	#classInstVars : [
		'developpement',
		'development'
	],
	#category : #'PrismCodeDisplayer-Core-Component'
}

{ #category : #'as yet unclassified' }
PrismComponent class >> beDeployment [
	<script>
	development:= false
]

{ #category : #'as yet unclassified' }
PrismComponent class >> beDevelopment [
	<script>
	development:= true.
]

{ #category : #'as yet unclassified' }
PrismComponent class >> isDevelopment [
	^ development ifNil: [ development := false ]
]

{ #category : #'as yet unclassified' }
PrismComponent class >> sourceCode: aSourceText linkObjects: aCollectionOfObject linkPositionFunction: aFunctionReturningInterval callBack: aBlockToExecture linkStyle: aStyleCssClass language: aCodeLanguage [
	^ self new
		sourceCode: aSourceText;
		addStrategy:
				(PrismComponentLinkStrategy new
						objects: aCollectionOfObject;
						positionFunction: aFunctionReturningInterval;
						callback: aBlockToExecture;
						style: aStyleCssClass);
		language: aCodeLanguage;
		yourself
]

{ #category : #menu }
PrismComponent >> addMenu: aString action: aBlockClosure [ 
	self menusWithAction add: aString -> aBlockClosure 
]

{ #category : #menu }
PrismComponent >> addMenu: aString action: aBlockClosure if: aBlockOrBool [
	aBlockOrBool value
		ifTrue: [ self addMenu: aString action: aBlockClosure ]
]

{ #category : #minimap }
PrismComponent >> addMinimapDemoMarkersFrom: startLine to: endLine [

	| lineIntervals step |
	step := 5.
	lineIntervals := (startLine to: endLine by: step) collect: [:each | each to: each + step].
	
	self addStrategy: 
		(PrismComponentLinkStrategy new
			objects: lineIntervals;
			positionFunction: [:interval | { 
				(self sourceCode prismIntervalOfLine: interval first - startLine) first to: 
				(self sourceCode prismIntervalOfLine: interval last - startLine) last } ];
			callback: [:interval | ];
			style: [:interval | ];
			miniMapColor: [:interval | Color random ])
]

{ #category : #strategies }
PrismComponent >> addStrategy: aPrismComponentStrategy [ 
	self strategies addLast: aPrismComponentStrategy 
]

{ #category : #callback }
PrismComponent >> at: anInteger ifPresent: aBlockClosure [ 
	aBlockClosure value: (self intervals at: anInteger)
]

{ #category : #accessing }
PrismComponent >> codeClassFor: aLanguage [
	aLanguage ifNil: [ ^ '' ].
	self flag: 'See if language entities should store that'.
	^ 'language-' , aLanguage
]

{ #category : #rendering }
PrismComponent >> computeSortedObjectWithIntervals [
	^ cacheSortedObjectWithIntervals := ((self strategies select: [ :strat | strat condition value ]) flatCollect: #intervals) sorted: [ :a :b | a first < b first ]
]

{ #category : #menu }
PrismComponent >> defineAjaxMenuFor: component onSelection: html [
	self menusWithAction
		ifNotEmpty: [ 
			html div
				id: 'menu' , component id asString;
				class: #prismSelectionMenu;
				with: [ 
							self menusWithAction
								doWithIndex: [ :aMenuWithAction :index | 
									html div
										onClick:
												([ :htm | 
													((self menusWithAction at: index) value createAjaxCallbacks: htm) ]
														value: html);
										with: aMenuWithAction key ] ] ]
]

{ #category : #menu }
PrismComponent >> defineMenuFor: component onSelection: html [
	self menusWithAction
		ifNotEmpty: [ 
			| cb |
			cb := component
				storeCallback:
					(WAValueCallback
						on: [ :object | 
							| stream |
							stream := ReadStream on: object.
							(self menusWithAction at: (stream upTo: $;) asInteger) value
								value: (stream upTo: $;) asInteger + 1
								value: (stream upTo: $;) asInteger
								value: stream upToEnd ]).
			html div
				id: 'menu' , component id asString;
				class: #prismSelectionMenu;
				with: [ 
							self menusWithAction
								doWithIndex: [ :aMenuWithAction :index | 
									html div
										with: [ self flag: 'todo: refactor'.
											html anchor
												onClick:
														(String
																streamContents: [ :s | 
																	s
																		<< 'o=Prism.pharo.getSpecialTextRange();post(''';
																		<< html actionUrl asString;
																		<< ''', {';
																		<< cb;
																		<< $:;
																		<< index;
																		<<
																				'+ ";" + o.start + ";" + o.end + ";" + o.previous})' ]);
												with: aMenuWithAction key ] ] ] ]
]

{ #category : #callback }
PrismComponent >> defineScrollCallbackOn: aPreTag url: url menuCallBack: menuCb [
	^ aPreTag
		storeCallback:
			(WAValueCallback
				on: [ :intervalRequest | 
					| interval |
					interval := intervalRequest substrings: ':'.
					self lastIndexLoad: (interval at:2).
					self requestContext
						respond: [ :response | 
							response
								nextPutAll:
									(NeoJSONWriter
										toString:
											(self
												displayComputedSourceCodeOnUrl: url asString
												callBack: menuCb
												startLine: (interval first asNumber max: 1)
												endLine: (interval last asNumber max: 400))) ] ])
]

{ #category : #rendering }
PrismComponent >> displayComputedSourceCodeOnUrl: url callBack: aCallBack startLine: start endLine: end [
	| string endCopy offset |
	string := self sourceCode.
	string isEmptyOrNil
		ifTrue: [ ^ Dictionary with: #html -> 'Error: No source to display.' with: #intervals -> {} ].
	self intervals: self obtainSortedObjectWithIntervals.
	endCopy := (string prismIntervalOfLine: end) last.
	endCopy = 0
		ifTrue: [ endCopy := string size ].
	offset := (string prismIntervalOfLine: start) first.
	^ ([ 
	{(#html -> (self protectCode: (string copyFrom: offset to: endCopy))).
	(#charOffset -> offset).
	(#start -> start).
	(#intervals -> (self obtainSortedJsInfoWithIntervalsForUrl: url between: offset and: endCopy))} ]
		on: Error
		do: [ :error | 
			self isDevelopment
				ifTrue: [ error pass ]
				ifFalse: [ {(#html -> 'Sorry but an error occured')} ] ]) asDictionary
]

{ #category : #accessing }
PrismComponent >> ensureIdFrom: html [
	self id ifNil: [ self id: html nextId ]
]

{ #category : #accessing }
PrismComponent >> id [
	^ id
]

{ #category : #accessing }
PrismComponent >> id: anObject [
	id := anObject
]

{ #category : #initialization }
PrismComponent >> initialize [
	super initialize.
	self startCountNumber: 1.
	self strategies: OrderedCollection new
]

{ #category : #accessing }
PrismComponent >> intervals [
	^ intervals
]

{ #category : #accessing }
PrismComponent >> intervals: anObject [
	intervals := anObject
]

{ #category : #initialization }
PrismComponent >> isDevelopment [
	^ self class isDevelopment
]

{ #category : #accessing }
PrismComponent >> jsOnChangeHook [
	^ jsOnChangeHook
]

{ #category : #accessing }
PrismComponent >> jsOnChangeHook: anObject [
	jsOnChangeHook := anObject
]

{ #category : #accessing }
PrismComponent >> jsOnLoadHook [
	^ jsOnLoadHook
]

{ #category : #accessing }
PrismComponent >> jsOnLoadHook: anObject [
	jsOnLoadHook := anObject
]

{ #category : #accessing }
PrismComponent >> language [
	^ language
]

{ #category : #accessing }
PrismComponent >> language: anObject [
	language := anObject
]

{ #category : #accessing }
PrismComponent >> lastIndexLoad [
	^ lastIndexLoad ifNil: [ lastIndexLoad := 400 asString ]
]

{ #category : #accessing }
PrismComponent >> lastIndexLoad: anObject [
	lastIndexLoad := anObject
]

{ #category : #accessing }
PrismComponent >> lineCount [
	^ lineCountCache ifNil: [ lineCountCache := self sourceCode lineCount ]
]

{ #category : #accessing }
PrismComponent >> menusWithAction [
	^ menusWithAction ifNil: [ menusWithAction := OrderedCollection new ]
]

{ #category : #accessing }
PrismComponent >> menusWithAction: anObject [
	menusWithAction := anObject
]

{ #category : #rendering }
PrismComponent >> obtainSortedJsInfoWithIntervalsForUrl: url between: min and: max [
	| res |
	res := OrderedCollection new.
	self obtainSortedObjectWithIntervals
		doWithIndex: [ :interval :index | 
			(interval first < max or: [ interval last > min ])
				ifTrue: [ 
					| end start |
					start := (interval first max: min) - 2.
					end := (interval last min: max) - 1.
					end > start
						ifTrue: [ 
							res
								add:
									{(#start -> start).
									(#end -> end).
									(#tag -> (interval tagForUrl: url index: index))} asDictionary ] ] ].
	^ res asArray
]

{ #category : #rendering }
PrismComponent >> obtainSortedObjectWithIntervals [
	^ cacheSortedObjectWithIntervals ifNil: [ self computeSortedObjectWithIntervals ]
]

{ #category : #accessing }
PrismComponent >> prismComponent [
	^ self
]

{ #category : #'html-specific' }
PrismComponent >> protectCode: code [
	^ code copyReplaceAll: '<' with: '&lt;'
]

{ #category : #rendering }
PrismComponent >> renderContentOn: html [
	| cb component |
	self resetCache.
	self ensureIdFrom: html.
	component := html preformatted
		class: 'prismComponent';
		class: #'line-numbers';
			"We substract one to convert to CSS convention (counting from 0)"
		style: 'counter-reset: linenumber ' , (self startCountNumber - 1) asString , ';';
		id: self id.
	cb := component storeCallback: (WAValuesCallback on: [ :interval | interval executeCallback ] values: self).
	self
		setDataForCallBack: component
		html: html
		scrollCb: (self defineScrollCallbackOn: component url: html actionUrl menuCallBack: cb)
		clickCb: cb.
	component
	   onLoad:self jsOnLoadHook; 
		with: [ 
					html code
						class: (self codeClassFor: self language);
						with: 'Waiting' ];
		yourself.
	self defineAjaxMenuFor: component onSelection: html
]

{ #category : #initialization }
PrismComponent >> resetCache [
	| oldLineCount|
	sourceCodeCache := nil.
	oldLineCount := lineCountCache.
	lineCountCache  := nil.
	cacheSortedObjectWithIntervals := nil.
	"Test if the source have been changed. In this case, we must go to start of the new source"
	self lineCount ~= oldLineCount ifTrue: [ lastIndexLoad := nil ]
]

{ #category : #callback }
PrismComponent >> setDataForCallBack: div html: html scrollCb: scrollCb clickCb: clickCb [
	self flag: #TODO.	"Remove hard coded values"
	div
		attributeAt: #'data-totallines' put: self lineCount asString;
		attributeAt: #'data-url' put: html actionUrl asString;
		attributeAt: #'data-cbId' put: scrollCb asString;
		attributeAt: #'data-lclickCb' put: clickCb;
		attributeAt: #'data-lastindexasked' put: -1 asString;
		attributeAt: #'data-lastindexloaded' put: self lastIndexLoad ;
		attributeAt: #'data-firstindex' put: -1 asString;
		attributeAt: #'data-lastindex' put: self lastIndexLoad;
		attributeAt: #'data-startcountnumber' put: (self startCountNumber - 1) asString;"We substract one to convert to CSS convention (counting from 0)"
		attributeAt: #'data-onloadhook' put: (self jsOnLoadHook ifNil: [ '' ]);	
		attributeAt: #'data-onchangehook' put: (self jsOnChangeHook ifNil: [ '' ])	
]

{ #category : #accessing }
PrismComponent >> sourceCode [
	^ sourceCodeCache ifNil: [ sourceCodeCache := sourceCode value ]
]

{ #category : #accessing }
PrismComponent >> sourceCode: anObject [
	sourceCode := anObject.
	self resetCache
]

{ #category : #accessing }
PrismComponent >> startCountNumber [
	^startCountNumber
]

{ #category : #accessing }
PrismComponent >> startCountNumber: aLineNumber [
	startCountNumber := aLineNumber 
]

{ #category : #hooks }
PrismComponent >> states [
	^ Array with: self
]

{ #category : #accessing }
PrismComponent >> strategies [
	^ strategies
]

{ #category : #accessing }
PrismComponent >> strategies: anObject [
	strategies := anObject
]

{ #category : #minimap }
PrismComponent >> withMinimap [
	self addDecoration: PrismMinimapDecoration new
]

{ #category : #strategies }
PrismComponent >> withSearchBar [
	| searchComponent |
	searchComponent := PrismSearchDecoration new.
	self addDecoration: searchComponent.
	self
		addStrategy:
			(PrismComponentStyleStrategy new
				objects: {searchComponent};
				positionFunction: [ :aSearchComponent | aSearchComponent lastSearchResult collect: [ :aInterval | (aInterval at: #start) to: (aInterval at: #end) ] ];
				style: [ :o | 'style="text-decoration: underline; text-decoration-color: #000"' ])
]
