rendering
renderBarOn: html
			
	(self renderEmptyBarOn: html) with: [ 
		self minimapTextIntervals do: [:each | each shouldBeDisplayedInMinimap ifTrue: [ self renderMarker: each on: html ]].
		self renderScrollMarkerOn: html ].
