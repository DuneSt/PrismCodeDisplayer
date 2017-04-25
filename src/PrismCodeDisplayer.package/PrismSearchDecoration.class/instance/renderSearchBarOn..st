rendering
renderSearchBarOn: html
	html div
		id: html nextId;
		class: 'prism-search-bar';
		with: [ 
					html textInput
						onChange:
							(html jQuery getJson
								callback: [ :aStringRegex | self linesMatcheTo: aStringRegex ] value: (JSStream on: 'event.target.value');
								text: [ :stream | stream json: self lastSearchResult ];
								onSuccess:
										'console.log(event.target,arguments[0]);
								Prism.searchBar.setSearchResults(event.target.parentElement, arguments[0])';
								dataType: 'jsonp').
					html button
						class: 'search-button';
						onClick: 'Prism.searchBar.prevElement( event.target.parentElement)';
						with: 'prev'.
					html button
						class: 'search-button';
						onClick: 'Prism.searchBar.nextElement( event.target.parentElement)';
						with: 'next'.
					self renderCounterOn: html ]