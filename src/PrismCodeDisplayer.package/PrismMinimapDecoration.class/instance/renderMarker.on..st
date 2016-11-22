rendering
renderMarker: interval on: html

	| ratio style top height script |
	ratio := 100.0 / self totalLineCount.
	top := (interval first - self startLine) * ratio.
	height := interval extent * ratio.
	style := 'background-color:#{1};top:{2}%;height:{3}%;' format: {
		interval miniMapColor asHexString.
		top printShowingDecimalPlaces: 2.
		height printShowingDecimalPlaces: 2 }.
	script := 'console.log("Go to marker: {1}:{2}"); loadPrism({1},{2},minimapScrollableFor(this).get(0))' format: { 
		interval first. 
		interval last }.

	html div
		class: 'minimap-marker minimap-bar-element';
		style: style;
		title: (interval first asString, ':', interval last asString);
		onClick: script.
