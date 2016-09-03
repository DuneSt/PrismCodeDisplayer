rendering
renderContentOn: html
	| action |
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	message
		ifNotNil: [ 
			html text: 'Selection: ' , selection asString.
			html break.
			html preformatted: message.
			html break.
			html preformatted: (method sourceCode copyFrom: selection first to: selection last) ].
	action := [ :startPos :endPos :selectedText | 
	selection := startPos to: endPos.
	message := selectedText ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
				addMenu: 'Select' action: action;
				addMenu: [ :htm | 
							htm image
								style: 'background-color: black;';
								url: 'http://prismjs.com/logo.svg' ]
					action: action)