as yet unclassified
createAjaxCallbacks: html
	^ html jQuery ajax
		callback: [ :jso | json := jso ] json: (JSStream on: 'Prism.pharo.getSpecialTextRange()');
		onComplete:
				((self chooseIfCallbackDraw: html)
						onComplete:
							self drawCallback , '$(".prismSelectionMenu").hide();refreshPrism($("#"+event.target.parentElement.id.substring(4))[0])')