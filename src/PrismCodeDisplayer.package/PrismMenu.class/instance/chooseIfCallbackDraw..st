as yet unclassified
chooseIfCallbackDraw: html
	^ self drawHTML
		ifFalse: [ html jQuery ajax
		callback: [ 
			self callback 
				value: (json at: #start)
				value: (json at: #end)
				value: (json at: #previous)
				value: html ]]
		ifTrue: [ 
			(html jQuery id: self drawHTMLOn) load
				html: [ :r | 
					self callback 
						value: (json at: #start)
						value: (json at: #end)
						value: (json at: #previous)
						value: r ] ]