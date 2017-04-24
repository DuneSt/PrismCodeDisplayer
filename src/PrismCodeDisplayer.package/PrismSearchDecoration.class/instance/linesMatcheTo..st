accessing
linesMatcheTo: regexString
	| source |
	source := self prismComponent sourceCode value.
	^ (source allRangesOfRegexMatches: regexString)
		collect: [ :interval | source lineNumberCorrespondingToIndex: interval first ]