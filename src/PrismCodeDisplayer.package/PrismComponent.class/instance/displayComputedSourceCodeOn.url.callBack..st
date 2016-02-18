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
					interval first - source position - 1 > 0
						ifTrue: [ t nextPutAll: (source next: interval first - source position - 1) ].
					t nextPutAll: '[[['.
					t nextPutAll: (source next: interval last - source position).
					t nextPutAll: ']]](' , url , '#' , aCallBack , '#' , (self linkObjects indexOf: asso key) asString , ')' ] ].
	t nextPutAll: source upToEnd