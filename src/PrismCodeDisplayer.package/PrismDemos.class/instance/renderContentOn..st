rendering
renderContentOn: html
	| action |
	selection :=(22 to: 81).
	method ifNil: [ method := PrismDemos methodNamed: #codeDemoPrism ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ]. 
	html
		render:
			((PrismComponent new
				sourceCode: [ method sourceCode ];
				addStrategy:
						(PrismComponentLinkStrategy new
								objects: ('function ?[^ (]*\([^)]*\)' asRegex matchesIn: method sourceCode );
								positionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ];
				            callback: [ :messageSent | method := messageSent implementors atRandom ];
				            style: [ :o |  ];
								miniMapColor: [:object | Color random]);
				language: #javascript)
				addStrategy:
						(PrismComponentStyleStrategy new
								objects: {'anObjectForPositionFunction'};
								positionFunction: [ :messageSent | {selection} ];
								style: [ :o | 'style="background: #e9d3fe"' ]);
				addMenu: 'Select' action: action;
				addMenu: [ :htm | 
							htm image
								style: 'background-color: black;';
								url: 'http://prismjs.com/logo.svg' ]
					action: action;
					withMinimap)