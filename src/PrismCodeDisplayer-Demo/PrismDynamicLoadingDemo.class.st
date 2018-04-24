Class {
	#name : #PrismDynamicLoadingDemo,
	#superclass : #PrismAbstractDemo,
	#category : #'PrismCodeDisplayer-Demo'
}

{ #category : #accessing }
PrismDynamicLoadingDemo class >> description [
	^ 'When the code to display is too long, the page might suffer performance wise. PrismJs for Seaside comes with a dynamic loading feature for such cases.'
]

{ #category : #accessing }
PrismDynamicLoadingDemo class >> title [
	^ 'Dynamic loading'
]

{ #category : #rendering }
PrismDynamicLoadingDemo >> renderPrismComponentOn: html [
	html
		render:
			(PrismComponent new
				sourceCode: [ PrismDemoRoot longJsDemoCode ];
				language: #javascript;
				jsOnLoadHook: ((html jQuery id: 'prism-demo-dynamic') load html: [ :ajaxHtml | ajaxHtml text: 'Ajax hook executed at ' , DateAndTime now printString ]);
				withMinimap;
				yourself).
	html div id: 'prism-demo-dynamic'
]
