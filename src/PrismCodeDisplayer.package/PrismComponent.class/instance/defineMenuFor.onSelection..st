menu
defineMenuFor: component onSelection: html
	self menusWithAction
		ifNotEmpty: [ 
			| cb |
			cb := component
				storeCallback:
					(WAValueCallback
						on: [ :object | 
							| stream |
							stream := ReadStream on: object.
							(self menusWithAction at: (stream upTo: $;) asInteger) value
								value: (stream upTo: $;) asInteger + 1
								value: (stream upTo: $;) asInteger
								value: stream upToEnd ]).
			html div
				id: 'menu' , component id asString;
				class: #prismSelectionMenu;
				with: [ 
							self menusWithAction
								doWithIndex: [ :aMenuWithAction :index | 
									html div
										with: [ self flag: 'todo: refactor'.
											html anchor
												onClick:
														(String
																streamContents: [ :s | 
																	s
																		<< 'post(''';
																		<< html actionUrl asString;
																		<< ''', {';
																		<< cb;
																		<< $:;
																		<< index;
																		<<
																				'+ ";" + (textSizeBefore(previousSelection.startContainer)+previousSelection.startOffset) + ";" + (textSizeBefore(previousSelection.endContainer)+previousSelection.endOffset) + ";" + previousSelection.toString()})' ]);
												with: aMenuWithAction key ] ] ] ]