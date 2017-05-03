rendering
obtainSortedJsInfoWithIntervalsForUrl: url between: min and: max
	| res |
	res := OrderedCollection new.
	self obtainSortedObjectWithIntervals
		doWithIndex: [ :interval :index | 
			((interval first < max) or: [(interval last > min)]) ifTrue:[
				|end start|
				start :=((interval first ) max: min)- 2.
				end := ((interval last ) min: max)-1.
				(end < start) ifTrue:[ end := max -1].
			res
				add:
					{(#start -> start).
					(#end -> end).
					(#tag -> (interval tagForUrl: url index: index))} asDictionary] ].
	^ res asArray