rendering
obtainSortedJsInfoWithIntervalsForUrl: url between: min and: max
	| res |
	res := OrderedCollection new.
	self obtainSortedObjectWithIntervals
		doWithIndex: [ :interval :index | 
			((interval first >= min) & (interval last<= max)) ifTrue:[
			res
				add:
					{(#start -> (interval first - 2)).
					(#end -> (interval last - 1)).
					(#tag -> (interval tagForUrl: url index: index))} asDictionary] ].
	^ res asArray