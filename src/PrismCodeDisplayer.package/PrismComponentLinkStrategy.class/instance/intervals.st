resolution
intervals
	^ self objects
		flatCollect: [ :anObject | 
			(self positionFunction value: anObject) asCollection
				collect: [ :anInterval | 
					PrismTextInterval new
						strategy: self;
						object: anObject;
						interval: anInterval;
						yourself ] ]