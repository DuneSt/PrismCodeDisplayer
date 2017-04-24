rendering
renderContentOn: html
	html div
		with: [ 
			self renderSearchBarOn: html.
			super renderContentOn: html ]