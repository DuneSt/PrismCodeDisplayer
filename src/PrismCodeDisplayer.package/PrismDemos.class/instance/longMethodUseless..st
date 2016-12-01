rendering
longMethodUseless: html
	| action |
	selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #longMethodUseless: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		
	selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		
	selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).
					
				
			
		selection :=(18 to: 22).
	method ifNil: [ method := PrismDemos methodNamed: #renderContentOn: ].
	self renderMessage: html.
	action := [ :startPos :endPos :selectedText :htm | 
	selection := startPos to: endPos.
	message := selectedText.
	(htm jQuery: '#messageContainer') load html: [ :ht | self renderMessage: ht ]  ].
	html
		render:
			((PrismComponent
				sourceCode: [ method sourceCode ]
				linkObjects: method messages
				linkPositionFunction: [ :messageSent | method sourceCode allRangesOfSubstring: messageSent ]
				callBack: [ :messageSent | method := messageSent implementors atRandom ]
				linkStyle: [ :o |  ]
				language: #smalltalk)
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
					action: action).