Class {
	#name : #PrismMenuDemo,
	#superclass : #PrismAbstractDemo,
	#category : #'PrismCodeDisplayer-Demo'
}

{ #category : #accessing }
PrismMenuDemo class >> description [
	^ 'This feature allow to interact with a portion of selected text form the user.'
]

{ #category : #accessing }
PrismMenuDemo class >> title [
	^ 'Menu'
]

{ #category : #rendering }
PrismMenuDemo >> renderMessageForInterval: selection on: html [
	selection
		ifNotNil: [ html text: 'Text selected from character ' , selection first asString , ' to ' , selection last asString.
			html break.
			html preformatted: (self sourceToDisplay copyFrom: selection first to: selection last) ]
]

{ #category : #rendering }
PrismMenuDemo >> renderPrismComponentOn: html [
	| action selection |
	action := [ :startPos :endPos :htm | 
	selection := startPos to: endPos.
	self renderMessageForInterval: selection on: htm ].
	html
		render:
			((PrismComponent new
				sourceCode: [ self sourceToDisplay ];
				language: #smalltalk)
				addMenu: 'Show current selection'
					action:
						(PrismMenu new
								callback: action;
								drawHTMLOn: 'messageContainer');
				addMenu: [ :htm | 
							htm image
								style: 'background-color: black;';
								url: 'http://prismjs.com/logo.svg' ]
					action:
						(PrismMenu new
							callback: action;
							drawHTMLOn: 'messageContainer')).
	html div id: 'messageContainer'
]

{ #category : #accessing }
PrismMenuDemo >> sourceToDisplay [
	^ (PrismComponent >> #renderContentOn:) sourceCode
]
