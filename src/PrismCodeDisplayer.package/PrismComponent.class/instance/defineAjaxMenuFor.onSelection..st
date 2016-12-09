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
										onClick:
												([ :htm | 
													((self menusWithAction at: index) value createAjaxCallbacks: htm) ]
														value: html);
										with: aMenuWithAction key ] ] ]