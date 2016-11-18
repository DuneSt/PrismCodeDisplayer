rendering
obtainSortedJsInfoWithIntervalsForUrl: url
	| res |
	res := OrderedCollection new.
	self obtainSortedObjectWithIntervals
		doWithIndex: [ :interval :index | 
			res
				add:
					{(#start -> (interval first - 1)).
					(#end -> interval last).
					(#tag -> (interval tagForUrl: url index: index))} asDictionary ].
	^ res asArray