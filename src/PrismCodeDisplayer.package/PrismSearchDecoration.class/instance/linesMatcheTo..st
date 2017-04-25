accessing
linesMatcheTo: regexString
	| source |
	source := self prismComponent sourceCode value.
	self
		lastSearchResult:
			((source allRangesOfRegexMatches: regexString)
				collect: [ :interval | {(#start -> (interval first - 2)).
					(#end -> (interval last - 1)).
					(#line -> (source lineNumberCorrespondingToIndex: interval first))} asDictionary ]).
	^ self lastSearchResult