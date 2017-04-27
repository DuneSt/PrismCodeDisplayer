rendering
renderContentOn: html
	html div
		with: [ 
			html div
				id: html nextId;
				class: 'prism-search-bar';
				with: [ self renderSearchBarOn: html ].
			super renderContentOn: html ]