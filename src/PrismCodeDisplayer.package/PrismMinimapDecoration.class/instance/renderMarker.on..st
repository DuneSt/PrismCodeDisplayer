rendering
renderMarker: aMinimapMarker on: html

	| ratio style top height script |
	ratio := 100.0 / interval extent.
	top := (aMinimapMarker interval first - interval first) * ratio.
	height := aMinimapMarker interval extent * ratio.
	style := 'background-color:#{1};top:{2}%;height:{3}%;' format: {
		aMinimapMarker color asHexString.
		top printShowingDecimalPlaces: 2.
		height printShowingDecimalPlaces: 2 }.
	script := 'console.log("Go to marker: {1}:{2}"); loadPrism({1},{2},minimapScrollableFor(this).get(0))' format: { 
		aMinimapMarker interval first. 
		aMinimapMarker interval last }.

	html div
		class: 'minimap-marker minimap-bar-element';
		style: style;
		title: (aMinimapMarker interval first asString, ':', aMinimapMarker interval last asString);
		onClick: script.
