rendering
displayComputedSourceCodeOn: t url: url callBack: aCallBack
	| source |
	source := self sourceCode value readStream.
	self intervals: self obtainSortedObjectWithIntervals.
	self intervals
		doWithIndex: [ :interval :index |
			interval last - source position > 0
				ifTrue: [ 
					interval first - source position - 1 > 0
						ifTrue: [ t nextPutAll: (self protectCode: (source next: interval first - source position - 1)) ].
					t
						nextPutAll: 'ế';
						nextPutAll: (self protectCode: (source next: interval last - source position));
						nextPutAll: 'ề(';
						nextPutAll: url;
						nextPut: $#;
						nextPutAll: aCallBack;
						nextPut: $#;
						nextPutAll: index asString;
						nextPut: $) ] ].
	t nextPutAll: (self protectCode: source upToEnd)