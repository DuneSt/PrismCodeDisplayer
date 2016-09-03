rendering
renderContentOn: html
	| action |
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	message ifNotNil: [ html preformatted: message ].
	action := [ :selectedText :startPos :endPos | message := 'Text selected from: ' , startPos asString , ' to: ' , endPos asString , ' selection: ' , selectedText ].
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