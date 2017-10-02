rendering
obtainSortedObjectWithIntervals
	^ cacheSortedObjectWithIntervals ifNil: [ self computeSortedObjectWithIntervals ]