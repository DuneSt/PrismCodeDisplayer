rendering
renderMarker: textInterval on: html
	| intervalOfCharacters firstLine endLine ratio style top height onClickScript |
	intervalOfCharacters := textInterval interval.
	firstLine := self sourceCode lineNumberCorrespondingToIndex: intervalOfCharacters first.
	endLine := self sourceCode lineNumberCorrespondingToIndex: intervalOfCharacters last.
	ratio := 100.0 / self totalLineCount.
	top := (firstLine - 1) * ratio.					"e.g. line 1 corresponds to 0%"
	height := (endLine - firstLine + 1) * ratio.	"e.g. 1-line interval corresponds to <ratio>%"

	style := 'background-color:#{1};top:{2}%;height:{3}%;'
		format: { 
			textInterval miniMapColor asHexString.
			top printShowingDecimalPlaces: 2.
			height printShowingDecimalPlaces: 2 }.
	onClickScript := 'console.log("Go to marker: {1}:{2}"); loadPrism({1},{2},minimapScrollableFor(this).get(0))'
		format: {
			intervalOfCharacters first.
			intervalOfCharacters last }.
	html div
		class: 'minimap-marker minimap-bar-element';
		style: style;
		onClick: onClickScript