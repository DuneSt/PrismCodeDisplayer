Class {
	#name : #PrismSimpleDemo,
	#superclass : #PrismAbstractDemo,
	#category : #'PrismCodeDisplayer-Demo'
}

{ #category : #accessing }
PrismSimpleDemo class >> description [
	^ 'I am a simple demo to show basic features of PrismJs for Seaside such has code displaying, syntax highlight and line numbering.'
]

{ #category : #accessing }
PrismSimpleDemo class >> title [
	^ 'Simple Demo'
]

{ #category : #rendering }
PrismSimpleDemo >> renderPrismComponentOn: html [
	html
		render:
			(PrismComponent new
				sourceCode: [ (PrismComponent >> #renderContentOn:) sourceCode ];
				language: #smalltalk;
				yourself)
]
