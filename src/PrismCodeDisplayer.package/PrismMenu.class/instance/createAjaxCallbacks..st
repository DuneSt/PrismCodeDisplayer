as yet unclassified
createAjaxCallbacks: html
	^html jQuery ajax
		callback: [ :jso | 
					json := jso ]
			json:
				(JSStream
					on:
						'{ start : (textSizeBefore(previousSelection.startContainer) +previousSelection.startOffset),
							end: (textSizeBefore(previousSelection.endContainer)+previousSelection.endOffset-1),
							previous: (previousSelection.toString())}');
		onComplete:
				((self
						chooseIfCallbackDraw: html)
						onComplete: self drawCallback , '$(".prismSelectionMenu").hide();refreshPrism($("#"+event.target.parentElement.id.substring(4))[0])')