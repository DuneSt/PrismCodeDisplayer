rendering
renderContentOn: html

	html div
		class: 'minimap-container';
		with: [ 
			self renderCodeOn: html.
			self renderBarOn: html ].