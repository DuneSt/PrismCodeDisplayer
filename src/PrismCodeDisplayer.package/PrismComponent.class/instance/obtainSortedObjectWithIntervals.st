rendering
obtainSortedObjectWithIntervals
	^ ((self strategies select: [ :strat | strat condition value ]) flatCollect: #intervals)
		sorted: [ :a :b | a first < b first ]