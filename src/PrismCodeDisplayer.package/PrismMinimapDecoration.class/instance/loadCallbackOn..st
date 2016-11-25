rendering
loadCallbackOn: tag 

	^ tag storeCallback: (WAValueCallback on: [ :request | 
		self requestContext respond: [ :response | 
			response nextPutAll: (WAHtmlCanvas builder render: [ :html | self renderBarWithMarkersOn: html ]) ]])