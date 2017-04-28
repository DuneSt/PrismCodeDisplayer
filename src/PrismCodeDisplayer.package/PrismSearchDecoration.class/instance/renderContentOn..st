rendering
renderContentOn: html
	html div
		class: 'prism-search-container';
		id: html nextId;
		"Used by javascript to link result regex to the prism component. This allow to have more than one prism component by page"
		style: 'position: relative;';
		with: [ 
					html div
						class: 'todo';
						style: 'position: absolute; display: flex;top:5px;right:35px;z-index:10;';
						with: [ 
									html div
										class: 'prism-search-bar';
										style: 'display:none';
										with: [ self renderSearchBarOn: html ].
									html image
										style: 'height: 20px; width: 20px;cursor: pointer;padding: 10px;';
										onClick:
												(JSStream on: '$(this).closest(".prism-search-container").find(".prism-search-bar").slideToggle( "slow" )');
										url: (PrismLibrary urlOf: 'search.png') ].
					super renderContentOn: html ]