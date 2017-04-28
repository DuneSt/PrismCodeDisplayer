rendering
renderContentOn: html
	html div
		class: 'prism-search-container';
		with: [ 
					html div
						class: 'prism-search-bar-container';
						with: [ 
									html div
										id: html nextId;
										class: 'prism-search-bar';
										style: 'display:none;';
										with: [ self renderSearchBarOn: html ].
									html image
										onClick:
												(JSStream on: '$(this).closest(".prism-search-container").find(".prism-search-bar").animate({width:''toggle''},350)');
										url: (PrismLibrary urlOf: 'search.png') ].
					super renderContentOn: html ]