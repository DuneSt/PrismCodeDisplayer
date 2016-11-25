rendering
renderBarWithMarkersOn: html

	(self renderEmptyBarOn: html) with: [ 
		self minimapTextIntervals do: [:each | self renderMarker: each on: html ].
		self renderScrollMarkerOn: html ].
