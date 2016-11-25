rendering
renderContentOn: html

	| container |
	container := html div.
	container
		attributeAt: 'data-url' put: html actionUrl asString;
		attributeAt: 'data-cbid' put: (self loadCallbackOn: container) asString.
	container
		class: 'minimap-container';
		with: [ 
			self renderCodeOn: html.
			self renderBarWithLoaderOn: html ].
