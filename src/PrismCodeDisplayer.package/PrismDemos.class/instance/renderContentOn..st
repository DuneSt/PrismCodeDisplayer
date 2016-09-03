rendering
renderContentOn: html
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	message ifNotNil: [ html text: message ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
				addMenu: 'Display Selection'
				action: [ :selectedText :startPos :endPos | message := 'Text selected from: ' , startPos asString , ' to: ' , endPos asString , ' selection: ' , selectedText ]).
	