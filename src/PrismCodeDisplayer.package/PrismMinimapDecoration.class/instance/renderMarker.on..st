rendering
renderMarker: textInterval on: html
	| interval ratio style top height script |
	interval := textInterval interval.
	ratio := 100.0 / self totalLineCount.
	top := (interval first - self startCountNumber) * ratio.
	height := interval extent * ratio.
	style := 'background-color:#{1};top:{2}%;height:{3}%;'
		format:
			{(textInterval miniMapColor asHexString).
			(top printShowingDecimalPlaces: 2).
			(height printShowingDecimalPlaces: 2)}.
	script := 'console.log("Go to marker: {1}:{2}"); loadPrism({1},{2},minimapScrollableFor(this).get(0))'
		format:
			{(interval first).
			(interval last)}.
	html div
		class: 'minimap-marker minimap-bar-element';
		style: style;
		onClick: script