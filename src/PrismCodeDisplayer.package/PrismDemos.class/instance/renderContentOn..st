rendering
renderContentOn: html
	| method |
	method := PrismComponent methodNamed: #renderContentOn:.
	html
		render:
			(PrismComponent
				sourceCode: method sourceCode
				linkObjects: method messages
				linkPositionFunction: [ :message | (method indexOfLiteral: message) to: (method indexOfLiteral: message) + message size ]
				callBack: [ :message | selectedMessage := message ]
				linkStyle: [ :o |  ]
				language: #smalltalk)