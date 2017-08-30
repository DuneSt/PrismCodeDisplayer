accessing
linesMatcheTo: regexString
	self
		lastSearchResult:
			((self sourceCode allRangesOfRegexMatches: regexString)
				collect: [ :interval | {(#start -> (interval first )).
					(#end -> (interval last )).
					(#line -> (self sourceCode lineNumberCorrespondingToIndex: interval first))} asDictionary ]).
	^ self lastSearchResult