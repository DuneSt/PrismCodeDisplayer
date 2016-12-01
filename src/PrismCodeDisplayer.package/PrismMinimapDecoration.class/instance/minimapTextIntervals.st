accessing
minimapTextIntervals
	"Answer all PrismComponent's intervals that have minimapColor"
	
	^ self next obtainSortedObjectWithIntervals reject: [:textInterval | textInterval miniMapColor isNil ]
