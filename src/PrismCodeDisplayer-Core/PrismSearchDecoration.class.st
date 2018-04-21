Class {
	#name : #PrismSearchDecoration,
	#superclass : #PrismAbstractDecoration,
	#instVars : [
		'lastSearchResult',
		'searchStrategy'
	],
	#category : #'PrismCodeDisplayer-Core-Component'
}

{ #category : #hook }
PrismSearchDecoration >> hookClass [
	^ ''
]

{ #category : #initialization }
PrismSearchDecoration >> initialize [
	super initialize.
	self searchStrategy: PrismInsensitiveRegexFilter
]

{ #category : #javascript }
PrismSearchDecoration >> jsOnClickNextElement [
	^ 'Prism.searchBar.nextElement( event.target)'
]

{ #category : #javascript }
PrismSearchDecoration >> jsOnClickPreviousElement [
	^ 'Prism.searchBar.prevElement( event.target)'
]

{ #category : #javascript }
PrismSearchDecoration >> jsOnTextChangeOn: html [
	^ html jQuery getJson
		callback: [ :aStringRegex | self searchWith: aStringRegex ] value: (JSStream on: 'event.target.value');
		text: [ :stream | stream json: self lastSearchResult ];
		onSuccess: 'Prism.searchBar.setSearchResults(event.target, arguments[0])';
		dataType: 'jsonp'
]

{ #category : #accessing }
PrismSearchDecoration >> lastSearchResult [
	^ lastSearchResult ifNil: [ OrderedCollection new ]
]

{ #category : #accessing }
PrismSearchDecoration >> lastSearchResult: anObject [
	lastSearchResult := anObject
]

{ #category : #accessing }
PrismSearchDecoration >> linesMatcheTo: regexString [
	self
		lastSearchResult:
			(regexString
				ifEmpty: [ "If the pattern is empty, no need to search" OrderedCollection new ]
				ifNotEmpty: [ (self searchStrategy allRangesFrom: self sourceCode for: regexString)
						collect: [ :interval | 
							{(#start -> interval first).
							(#end -> interval last).
							(#line -> (self sourceCode lineNumberCorrespondingToIndex: interval first))} asDictionary ] ]).
	^ self lastSearchResult
]

{ #category : #rendering }
PrismSearchDecoration >> renderContentOn: html [
	html div
		class: 'prism-search-container';
		with: [ 
					html div
						class: 'prism-search-bar-container';
						class: self hookClass;
						with: [ 
									html div
										id: html nextId;
										class: 'prism-search-bar';
										style: 'display:none;';
										with: [ self renderSearchBarOn: html ].	
											
									"Let insecable space in the following shortcut display."
									html div
										attributeAt: 'tooltip' put: 'Ctrl + Shift + f';
										class: 'prism-search-bar__toogle-icon';
										with: [ 
													html image
														onClick: (JSStream on: 'Prism.searchBar.toggleSearchBarFor(this);');
														url: (PrismLibrary urlOf: 'search.png') ] ].
					super renderContentOn: html ]
]

{ #category : #rendering }
PrismSearchDecoration >> renderCounterOn: html [
	html div
		class: 'prism-search-counter';
		with: '0/0'
]

{ #category : #rendering }
PrismSearchDecoration >> renderSearchBarOn: html [
	html textInput
		placeholder: 'Prism\.?languages\.?javascript';
		attributeAt: 'autocomplete' put: #off;
		onChange: (self jsOnTextChangeOn: html);
		with: ''.
	html image url: (PrismLibrary urlOf: 'search.png').
	html button
		onClick: self jsOnClickPreviousElement;
		with: 'prev'.
	html button
		onClick: self jsOnClickNextElement;
		with: 'next'.
	self renderCounterOn: html
]

{ #category : #accessing }
PrismSearchDecoration >> searchStrategy [
	^ searchStrategy
]

{ #category : #accessing }
PrismSearchDecoration >> searchStrategy: anObject [
	searchStrategy := anObject
]

{ #category : #action }
PrismSearchDecoration >> searchWith: aStringRegex [
	self linesMatcheTo: aStringRegex.
	self resetSortedObjectWithIntervals
]
