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
							response
								nextPutAll:
									(NeoJSONWriter
										toString:
											(self
												displayComputedSourceCodeOnUrl: url asString
												callBack: menuCb
												startLine: (interval first asNumber max: 1)
												endLine: (interval last asNumber max: 400))) ] ])