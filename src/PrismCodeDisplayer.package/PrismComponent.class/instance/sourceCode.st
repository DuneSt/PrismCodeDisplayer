accessing
sourceCode
	^ sourceCodeCache ifNil: [ sourceCodeCache := sourceCode value ]