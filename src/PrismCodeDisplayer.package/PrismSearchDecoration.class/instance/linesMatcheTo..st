accessing
linesMatcheTo: regexString
	self
		lastSearchResult:
			((self searchStrategy allRangesFrom: self sourceCode for: regexString)
				collect: [ :interval | 
					{(#start -> interval first).
					(#end -> interval last).
					(#line -> (self sourceCode lineNumberCorrespondingToIndex: interval first))} asDictionary ]).
	^ self lastSearchResult