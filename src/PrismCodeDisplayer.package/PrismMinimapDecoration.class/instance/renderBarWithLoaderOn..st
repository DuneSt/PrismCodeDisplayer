rendering
renderBarWithLoaderOn: html

	(self renderEmptyBarOn: html)
		with: [ html div class: 'minimap-loading' ]