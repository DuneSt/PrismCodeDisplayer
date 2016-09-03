rendering
renderContentOn: html
	method ifNil: [method := PrismComponent methodNamed: #renderContentOn:].
	html
		render:
			(PrismComponent
				sourceCode: method sourceCode
				linkObjects: method messages
				linkPositionFunction: [ :message | (method sourceCode allRangesOfSubstring: message)]
				callBack: [ :message | method := message implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)