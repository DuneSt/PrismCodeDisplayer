initialization
resetCache
	| oldLineCount|
	sourceCodeCache := nil.
	oldLineCount := lineCountCache.
	lineCountCache  := nil.
	"Test if the source have been changed. In this case, we must go to start of the new source"
	self lineCount ~= oldLineCount ifTrue: [ lastIndexLoad := nil ]