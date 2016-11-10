callback
defineScrollCallbackOn: aDiv
	^ aDiv
		storeCallback:
			(WAValueCallback
				on: [ :intervalRequest | 
					| interval |
					interval := intervalRequest substrings: ':'.
					self requestContext
						respond: [ :response | 
							self
								displayComputedSourceCodeOn:
									(response
										doNotCache;
										contentType: WAMimeType textHtml;
										stream)
								url: 'fake' asString
								callBack: 5
								startLine: (interval first asNumber max: 1)
								endLine: (interval last asNumber max: 400) ] ])