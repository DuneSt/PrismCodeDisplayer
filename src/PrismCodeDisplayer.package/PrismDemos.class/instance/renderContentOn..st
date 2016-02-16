rendering
renderContentOn: html
	| method |
	method := PrismComponent methodNamed: #renderContentOn:.
	html
		render:
			(PrismComponent
				sourceCode: method sourceCode
				linkObjects: method messages
				linkPositionFunction: [ :message | (method sourceCode allRangesOfSubstring: message)]
				callBack: [ :message | selectedMessage := message ]
				linkStyle: [ :o |  ]
				language: #fourD)