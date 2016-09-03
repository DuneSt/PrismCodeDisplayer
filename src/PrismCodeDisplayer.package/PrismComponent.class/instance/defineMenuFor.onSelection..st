menu
defineMenuFor: component onSelection: html
	self menusWithAction
		ifNotEmpty: [ 
			| cb |
			cb := component
				storeCallback:
					(WAValueCallback
						on: [ :object | 
							(self menusWithAction at: (object first: (object indexOf: $;) - 1) asInteger) value
								value: (object copyFrom: (object indexOf: $;) + 1 to: object size)
								value: 5
								value: 10 ]).
			html div
				id: 'menu' , component id asString;
				class: #selectionMenu;
				with: [ 
							self menusWithAction
								doWithIndex: [ :aMenuWithAction :index | 
									html div
										with: [ 
											html anchor
												onClick:
														'post(''' , html actionUrl asString , ''', {' , cb , ':' , index asString , '+ ";" + previousSelection})';
												with: aMenuWithAction key ] ] ] ]