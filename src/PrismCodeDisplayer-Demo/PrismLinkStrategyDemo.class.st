Class {
	#name : #PrismLinkStrategyDemo,
	#superclass : #PrismAbstractDemo,
	#instVars : [
		'method'
	],
	#category : #'PrismCodeDisplayer-Demo'
}

{ #category : #accessing }
PrismLinkStrategyDemo class >> description [
	^ 'It might be conveniant to add links to portions of the code. Prism allow this via a Link Strategy.'
]

{ #category : #accessing }
PrismLinkStrategyDemo class >> title [
	^ 'Link strategy'
]

{ #category : #rendering }
PrismLinkStrategyDemo >> renderPrismComponentOn: html [
	| colorMap |
	colorMap := Dictionary new.
	method ifNil: [ method := PrismComponent >> #renderContentOn: ].
	html
		render:
			(PrismComponent new
				sourceCode: [ method sourceCode ];
				language: #smalltalk;
				addStrategy:
					(PrismComponentLinkStrategy new
						objects: [ method messages ];
						positionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ];
						callback: [ :messageSent | method := messageSent asSymbol implementors atRandom ];
						style: [ :interval :messageSent | 
							colorMap at: messageSent put: Color random.
							'style="color: #' , (colorMap at: messageSent) asHexString , ';" class="YouCanAddAClass"' ];
						miniMapColor: [ :interval :messageSent | colorMap at: messageSent ]);
				withMinimap;
				yourself)
]
