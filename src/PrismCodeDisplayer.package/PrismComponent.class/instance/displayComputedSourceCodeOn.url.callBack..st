rendering
displayComputedSourceCodeOn: t url: url callBack: aCallBack
	| source |
	source := self sourceCode value readStream.
	aCallBack
		ifNotNil: [ 
			self obtainSortedObjectWithIntervals
				do: [ :asso | 
					| interval |
					interval := asso value.
					interval last - source position > 0
						ifTrue: [ 
							interval first - source position - 1 > 0
								ifTrue: [ t nextPutAll: (source next: interval first - source position - 1) ].
							t
								nextPutAll: 'ế';
								nextPutAll: (source next: interval last - source position);
								nextPutAll: 'ề(';
								nextPutAll: url;
								nextPut: $#;
								nextPutAll: aCallBack;
								nextPut: $#;
								nextPutAll: (self linkObjects indexOf: asso key) asString;
								nextPut: $) ] ] ].
	t nextPutAll: source upToEnd