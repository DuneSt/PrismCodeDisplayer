Class {
	#name : #PrismMenu,
	#superclass : #Object,
	#instVars : [
		'drawHTML',
		'drawCallback',
		'callback',
		'json',
		'target'
	],
	#category : #'PrismCodeDisplayer-Core-Component'
}

{ #category : #accessing }
PrismMenu >> callback [
  ^callback
]

{ #category : #accessing }
PrismMenu >> callback: aJSStringOrABlock [
  callback:= aJSStringOrABlock
]

{ #category : #'as yet unclassified' }
PrismMenu >> chooseIfCallbackDraw: html [
	^ self drawHTML
		ifFalse: [ 
			html jQuery ajax
				callback: [ 
					self callback
						cull: (json at: #start)
						cull: (json at: #end)
						cull: html ] ]
		ifTrue: [ 
			(html jQuery id: self drawHTMLOn) load
				html: [ :r | 
					self callback
						cull: (json at: #start)
						cull: (json at: #end)
						cull: r ] ]
]

{ #category : #'as yet unclassified' }
PrismMenu >> createAjaxCallbacks: html [
	^ html jQuery ajax
		callback: [ :jso | json := jso ] json: (JSStream on: 'Prism.pharo.getSpecialTextRange()');
		onComplete:
				((self chooseIfCallbackDraw: html)
						onComplete:
							self drawCallback , '$(".prismSelectionMenu").hide();refreshPrism($("#"+event.target.parentElement.id.substring(4))[0])')
]

{ #category : #accessing }
PrismMenu >> drawCallback [
  ^drawCallback
]

{ #category : #accessing }
PrismMenu >> drawCallback: aJSString [
  drawCallback:= aJSString
]

{ #category : #accessing }
PrismMenu >> drawHTML [
  ^drawHTML
]

{ #category : #accessing }
PrismMenu >> drawHTML: aBool [
  drawHTML:= aBool
]

{ #category : #'as yet unclassified' }
PrismMenu >> drawHTMLOn [
  ^target
]

{ #category : #'as yet unclassified' }
PrismMenu >> drawHTMLOn: anId [
	target := anId.
	self enableDraw
]

{ #category : #'as yet unclassified' }
PrismMenu >> enableDraw [
  self drawHTML: true
]

{ #category : #'as yet unclassified' }
PrismMenu >> enableDrawHTML [
  self drawHTML: true
]

{ #category : #initialization }
PrismMenu >> initialize [
	super initialize.
	drawHTML := false.
	drawCallback := ''
]
