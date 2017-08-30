accessing
lineCount
	^ lineCountCache ifNil: [ lineCountCache := self sourceCode lineCount ]