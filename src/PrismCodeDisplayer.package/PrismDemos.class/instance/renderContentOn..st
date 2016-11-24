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
			((PrismComponent new
				sourceCode: [ method sourceCode ];
				addStrategy:
						(PrismComponentLinkStrategy new
								objects: method messages;
								positionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ];
								callback: [ :messageSent | method := messageSent implementors atRandom ];
								style: [ :o |  ];
								miniMapColor: [:object | Color random]);
				language: #smalltalk)
				addStrategy:
						(PrismComponentStyleStrategy new
								objects: {'anObjectForPoositionFunction'};
								positionFunction: [ :messageSent | {(20 to: 59)} ];
								style: [ :o | 'style="background: #e9d3fe"' ]);
				addMenu: 'Select' action: action;
				addMenu: [ :htm | 
							htm image
								style: 'background-color: black;';
								url: 'http://prismjs.com/logo.svg' ]
					action: action;
				withMinimap)