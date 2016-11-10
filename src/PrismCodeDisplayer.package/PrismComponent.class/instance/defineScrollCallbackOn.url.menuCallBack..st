callback
defineScrollCallbackOn: aPreTag url: url menuCallBack: menuCb
	^ aPreTag
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
								url: url asString
								callBack: menuCb
								startLine: (interval first asNumber max: 1)
								endLine: (interval last asNumber max: 400) ] ])