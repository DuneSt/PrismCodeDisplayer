accessing
linesMatcheTo: regexString
	self
		lastSearchResult:
			(regexString
				ifEmpty: [ "If the pattern is empty, no need to search" OrderedCollection new ]
				ifNotEmpty: [ (self searchStrategy allRangesFrom: self sourceCode for: regexString)
						collect: [ :interval | 
							{(#start -> interval first).
							(#end -> interval last).
							(#line -> (self sourceCode lineNumberCorrespondingToIndex: interval first))} asDictionary ] ]).
	^ self lastSearchResult