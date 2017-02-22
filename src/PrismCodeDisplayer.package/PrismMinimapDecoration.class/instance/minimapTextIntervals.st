accessing
minimapTextIntervals
	"Answer all PrismComponent's intervals that have minimapColor"
	
	^ self decoratedComponent obtainSortedObjectWithIntervals reject: [:textInterval | textInterval miniMapColor isNil ]
