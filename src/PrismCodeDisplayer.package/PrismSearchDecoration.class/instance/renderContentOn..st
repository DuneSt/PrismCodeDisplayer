rendering
renderContentOn: html
	html div
		class: 'prism-search-container';
		style: 'position: relative;';
		with: [ 
					html div
						class: 'todo';
						style: 'position: absolute; display: flex;top:0;right:45px;z-index:10;background-color: #FFF;padding: 5px 10px;border-radius:0 0 5px 5px;';
						with: [ 
									html div
										id: html nextId;
										class: 'prism-search-bar';
										style: 'display:none;';
										with: [ self renderSearchBarOn: html ].
									html image
										style: 'height: 20px; width: 20px;cursor: pointer;padding: 10px;';
										onClick:
												(JSStream on: '$(this).closest(".prism-search-container").find(".prism-search-bar").animate({width:''toggle''},350)');
										url: (PrismLibrary urlOf: 'search.png') ].
					super renderContentOn: html ]