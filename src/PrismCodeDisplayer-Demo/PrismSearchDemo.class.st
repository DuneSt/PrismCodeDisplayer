Class {
	#name : #PrismSearchDemo,
	#superclass : #PrismAbstractDemo,
	#category : #'PrismCodeDisplayer-Demo'
}

{ #category : #accessing }
PrismSearchDemo class >> description [
	^ 'I am a demo to show the use of PrismJs for Seaside Search function. This function can be used via shortcut. Open the search with "Ctrl + Shift + f" and naviguate in the results with the up and down arrows.'
]

{ #category : #accessing }
PrismSearchDemo class >> title [
	^ 'Search'
]

{ #category : #rendering }
PrismSearchDemo >> renderPrismComponentOn: html [
	html
		render:
			(PrismComponent new
				sourceCode: [ PrismDemoRoot longJsDemoCode ];
				language: #javascript;
				withSearchBar;
				withMinimap;
				yourself).
	html div id: 'prism-demo-dynamic'
]
