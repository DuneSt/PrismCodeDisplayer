rendering
obtainSortedJsInfoWithIntervalsForUrl: url
	| res |
	res := OrderedCollection new.
	self obtainSortedObjectWithIntervals
		doWithIndex: [ :interval :index | 
			res
				add:
					{(#start -> (interval first - 2)).
					(#end -> (interval last - 1)).
					(#tag -> (interval tagForUrl: url index: index))} asDictionary ].
	^ res asArray