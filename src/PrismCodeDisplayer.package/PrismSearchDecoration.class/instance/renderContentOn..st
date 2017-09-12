rendering
renderContentOn: html
	html div
		class: 'prism-search-container';
		with: [ 
					html div
						class: 'prism-search-bar-container';
						class: self hookClass;
						with: [ 
									html div
										id: html nextId;
										class: 'prism-search-bar';
										style: 'display:none;';
										with: [ self renderSearchBarOn: html ].	
											
									"Let insecable space in the following shortcut display."
									html div
										attributeAt: 'tooltip' put: 'Ctrl + Shift + f';
										class: 'prism-search-bar__toogle-icon';
										with: [ 
													html image
														onClick: (JSStream on: 'Prism.searchBar.toggleSearchBarFor(this);');
														url: (PrismLibrary urlOf: 'search.png') ] ].
					super renderContentOn: html ]