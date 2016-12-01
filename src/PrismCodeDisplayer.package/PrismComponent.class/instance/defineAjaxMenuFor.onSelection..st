menu
defineAjaxMenuFor: component onSelection: html
	self menusWithAction
		ifNotEmpty: [ 
			html div
				id: 'menu' , component id asString;
				class: #prismSelectionMenu;
				with: [ 
							self menusWithAction
								doWithIndex: [ :aMenuWithAction :index |
									html div
									 onClick: ([ :htm| 
			html jQuery ajax
				callback: ([  :jso |(self menusWithAction at: index) value
								value: (jso at: #start )
								value: (jso at: #end )
								value: (jso at: #previous ) 
								value: htm] ) json: (JSStream on: '{ start : (textSizeBefore(previousSelection.startContainer) +previousSelection.startOffset+1),
							end: (textSizeBefore(previousSelection.endContainer)+previousSelection.endOffset),
							previous: (previousSelection.toString())}');
				onComplete:
				      ('refreshPrism($("#"+event.target.parentElement.id.substring(4))[0])')
						"((htm jQuery: '#tagListContainer') load
								html: [ :ht | self renderOnlyListOn: htm ];
								onComplete: 'componentHandler.upgradeDom()')" ] value:html);
												with: aMenuWithAction key ] ] ] 