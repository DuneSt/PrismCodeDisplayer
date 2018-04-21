"
I can decorate a PrismComponent to attach a vertical bar with markers.
"
Class {
	#name : #PrismMinimapDecoration,
	#superclass : #PrismAbstractDecoration,
	#category : 'PrismCodeDisplayer-Minimap'
}

{ #category : #accessing }
PrismMinimapDecoration >> intervalsToBeDisplayedInMinimap [
	^ self decoratedComponent intervals ifNil: [ {} ] ifNotNil: [ :intervs | intervs select: #shouldBeDisplayedInMinimap ]
]

{ #category : #rendering }
PrismMinimapDecoration >> loadCallbackOn: tag [ 

	^ tag storeCallback: (WAValueCallback on: [ :request | 
		self requestContext respond: [ :response | 
			response nextPutAll: (WAHtmlCanvas builder render: [ :html | self renderBarWithMarkersOn: html ]) ]])
]

{ #category : #accessing }
PrismMinimapDecoration >> minimapTextIntervals [
	"Answer all PrismComponent's intervals that have minimapColor"
	
	^ self decoratedComponent obtainSortedObjectWithIntervals reject: [:textInterval | textInterval miniMapColor isNil ]

]

{ #category : #rendering }
PrismMinimapDecoration >> renderBarOn: html [
			
	(self renderEmptyBarOn: html) with: [ 
		self minimapTextIntervals do: [:each | self renderMarker: each on: html ].
		self renderScrollMarkerOn: html ].

]

{ #category : #rendering }
PrismMinimapDecoration >> renderBarWithLoaderOn: html [

	(self renderEmptyBarOn: html)
		with: [ html div class: 'minimap-loading' ]
]

{ #category : #rendering }
PrismMinimapDecoration >> renderBarWithMarkersOn: html [

	(self renderEmptyBarOn: html) with: [ 
		self intervalsToBeDisplayedInMinimap do: [:each | self renderMarker: each on: html ].
		self renderScrollMarkerOn: html ].

]

{ #category : #rendering }
PrismMinimapDecoration >> renderCodeOn: html [

	html div
		class: 'minimap-code';
		with: [ super renderContentOn: html ]
]

{ #category : #rendering }
PrismMinimapDecoration >> renderContentOn: html [
	| container |
	(container := html div)
		attributeAt: 'data-url' put: html actionUrl asString;
		attributeAt: 'data-cbid' put: (self loadCallbackOn: container) asString;
		class: 'minimap-container';
		with: [ 
					self renderCodeOn: html.
					self renderBarWithLoaderOn: html ]
]

{ #category : #rendering }
PrismMinimapDecoration >> renderEmptyBarOn: html [

	^ html div class: 'minimap-bar'; onClick: 'target=$(event.target).closest("div.minimap-bar")[0];
height=(event.clientY - target.getBoundingClientRect().y) * 100 / target.clientHeight; pre= $(target.parentNode).find("pre")[0]
goToLine((Math.floor(height * pre.dataset.totallines / 100)),pre )'
]

{ #category : #rendering }
PrismMinimapDecoration >> renderMarker: textInterval on: html [
	| intervalOfCharacters firstLine endLine ratio style top height |
	intervalOfCharacters := textInterval interval.
	firstLine := self sourceCode lineNumberCorrespondingToIndex: intervalOfCharacters first.
	endLine := self sourceCode lineNumberCorrespondingToIndex: intervalOfCharacters last.
	ratio := 100.0 / self lineCount.
	top := (firstLine - 1) * ratio.	"e.g. line 1 corresponds to 0%"
	height := (endLine - firstLine + 1) * ratio.	"e.g. 1-line interval corresponds to <ratio>%"
	style := 'background-color:{1};top:{2}%;height:{3}%;'
		format:
			{(textInterval miniMapColor asRGBA: 0.33).
			(top printShowingDecimalPlaces: 2).
			(height printShowingDecimalPlaces: 2)}.
	html div
		class: 'minimap-marker minimap-bar-element';
		style: style
]

{ #category : #rendering }
PrismMinimapDecoration >> renderScrollMarkerOn: html [

	html div class: 'minimap-scroll-marker minimap-bar-element'

]

{ #category : #accessing }
PrismMinimapDecoration >> startCountNumber [
	^ self decoratedComponent startCountNumber
]
