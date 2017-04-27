javascript
onTextChangeOn: html
	^ html jQuery getJson
		callback: [ :aStringRegex | self linesMatcheTo: aStringRegex ] value: (JSStream on: 'event.target.value');
		text: [ :stream | stream json: self lastSearchResult ];
		onSuccess:
				'console.log(event.target,arguments[0]);
								Prism.searchBar.setSearchResults(' , self parentLocalisation , ', arguments[0])';
		dataType: 'jsonp'