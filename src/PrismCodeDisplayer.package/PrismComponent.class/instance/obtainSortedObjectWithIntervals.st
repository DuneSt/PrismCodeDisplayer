rendering
obtainSortedObjectWithIntervals
	^ (self linkObjects
		flatCollect: [ :anObject | 
			| intervals |
			intervals := self linkPositionFunction value: anObject.
			intervals isInterval
				ifTrue: [ intervals := {intervals} ].
			intervals collect: [ :int | anObject -> int ] ]) sorted: [ :asso1 :asso2 | asso1 value first < asso2 value first ]