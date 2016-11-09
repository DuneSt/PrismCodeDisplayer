rendering
obtainSortedObjectWithIntervals
	^ (self strategies flatCollect: #intervals) sorted: [ :a :b | a first < b first ]
	