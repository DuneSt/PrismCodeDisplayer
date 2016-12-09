rendering
renderMessage: html
	message
		ifNotNil: [ 
			html text: 'Selection: ' , selection asString.
			html break.
			html preformatted: message.
			html break.
			html preformatted: (method sourceCode copyFrom: selection first to: selection last) ]