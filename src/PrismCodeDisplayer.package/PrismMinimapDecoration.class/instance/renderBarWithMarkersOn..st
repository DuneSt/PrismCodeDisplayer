rendering
renderBarWithMarkersOn: html

	(self renderEmptyBarOn: html) with: [ 
		self intervalsToBeDisplayedInMinimap do: [:each | self renderMarker: each on: html ].
		self renderScrollMarkerOn: html ].
