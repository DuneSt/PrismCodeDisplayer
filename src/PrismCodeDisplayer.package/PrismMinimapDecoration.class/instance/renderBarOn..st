rendering
renderBarOn: html
			
	html div
		class: 'minimap-bar';
		with: [ 
			self markers do: [:each | self renderMarker: each on: html ].
			self renderScrollMarkerOn: html ]