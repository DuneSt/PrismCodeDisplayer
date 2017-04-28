rendering
renderContentOn: html
	html div
		class: 'prism-search-container';
		style: 'position: relative;';
		with: [ 
					html div
						class: 'todo';
						style: 'position: absolute; display: flex;top:5px;right:35px;z-index:10;';
						with: [ 
									html div
										id: html nextId;
										class: 'prism-search-bar';
										style: 'display:none';
										with: [ self renderSearchBarOn: html ].
									html image
										style: 'height: 20px; width: 20px;cursor: pointer;padding: 10px;';
										onClick:
												(JSStream on: '$(this).closest(".prism-search-container").find(".prism-search-bar").slideToggle( "slow" )');
										url: (PrismLibrary urlOf: 'search.png') ].
					super renderContentOn: html ]