accessing
linesMatcheTo: regexString
	| source |
	source := self prismComponent sourceCode value.
	self
		lastSearchResult:
			((source allRangesOfRegexMatches: regexString)
				collect: [ :interval | {(#start -> (interval first )).
					(#end -> (interval last )).
					(#line -> (source lineNumberCorrespondingToIndex: interval first))} asDictionary ]).
	^ self lastSearchResult