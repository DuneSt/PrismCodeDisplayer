Class {
	#name : #PrismStyleStrategyDemo,
	#superclass : #PrismAbstractDemo,
	#instVars : [
		'method'
	],
	#category : #'PrismCodeDisplayer-Demo'
}

{ #category : #accessing }
PrismStyleStrategyDemo class >> description [
	^ 'PrismJs implement a conveniant way to customize portion of the displayed source text via the Style strategies.'
]

{ #category : #accessing }
PrismStyleStrategyDemo class >> title [
	^ 'Style strategy'
]

{ #category : #rendering }
PrismStyleStrategyDemo >> renderPrismComponentOn: html [
	| colorMap |
	colorMap := Dictionary new.
	method ifNil: [ method := PrismComponent >> #renderContentOn: ].
	html
		render:
			(PrismComponent new
				sourceCode: [ method sourceCode ];
				language: #smalltalk;
				addStrategy:
					(PrismComponentStyleStrategy new
						objects: [ method messages ];
						positionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ];
						style: [ :interval :messageSent | 
							colorMap at: messageSent put: Color random.
							'style="color: #' , (colorMap at: messageSent) asHexString , ';" class="YouCanAddAClass"' ];
						miniMapColor: [ :interval :messageSent | colorMap at: messageSent ]);
				withMinimap;
				yourself)
]
