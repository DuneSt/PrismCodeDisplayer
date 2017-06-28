as yet unclassified
chooseIfCallbackDraw: html
	^ self drawHTML
		ifFalse: [ 
			html jQuery ajax
				callback: [ 
					self callback
						cull: (json at: #start)
						cull: (json at: #end)
						cull: html ] ]
		ifTrue: [ 
			(html jQuery id: self drawHTMLOn) load
				html: [ :r | 
					self callback
						cull: (json at: #start)
						cull: (json at: #end)
						cull: r ] ]