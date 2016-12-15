as yet unclassified
createAjaxCallbacks: html
	^html jQuery ajax
		callback: [ :jso | 
					json := jso ]
			json:
				(JSStream
					on:
						'{ start : (textSizeBefore(previousSelection.startContainer) +previousSelection.startOffset+ parseInt(previousSelection.commonAncestorContainer.dataset.offset)),
							end: (textSizeBefore(previousSelection.endContainer)+previousSelection.endOffset+1 +parseInt(previousSelection.commonAncestorContainer.dataset.offset)),
							previous: (previousSelection.toString())}');
		onComplete:
				((self
						chooseIfCallbackDraw: html)
						onComplete: self drawCallback , ';refreshPrism($("#"+event.target.parentElement.id.substring(4))[0])')