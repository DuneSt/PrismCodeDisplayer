Class {
	#name : #PrismCopyDemo,
	#superclass : #PrismAbstractDemo,
	#category : #'PrismCodeDisplayer-Demo'
}

{ #category : #accessing }
PrismCopyDemo class >> description [
	^ 'Allow the user to copy the content of the file on a click.'
]

{ #category : #accessing }
PrismCopyDemo class >> title [
	^ 'Copy on click'
]

{ #category : #rendering }
PrismCopyDemo >> renderPrismComponentOn: html [
	html
		render:
			(PrismComponent new
				sourceCode: [ (PrismComponent >> #renderContentOn:) sourceCode ];
				language: #smalltalk;
				enableCopyOnClick)
]
