rendering
renderContentOn: html
	| container |
	(container := html div)
		attributeAt: 'data-url' put: html actionUrl asString;
		attributeAt: 'data-cbid' put: (self loadCallbackOn: container) asString;
		class: 'minimap-container';
		with: [ 
					self renderCodeOn: html.
					self renderBarWithLoaderOn: html ]