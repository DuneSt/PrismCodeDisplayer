javascript
jsOnTextChangeOn: html
	^ html jQuery getJson
		callback: [ :aStringRegex | self linesMatcheTo: aStringRegex ] value: (JSStream on: 'event.target.value');
		text: [ :stream | stream json: self lastSearchResult ];
		onSuccess:
				'Prism.searchBar.setSearchResults(event.target, arguments[0])';
		dataType: 'jsonp'