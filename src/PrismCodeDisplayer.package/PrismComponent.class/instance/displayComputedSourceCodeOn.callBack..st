rendering
displayComputedSourceCodeOn: t callBack: aCallBack
	| source |
	source := self sourceCode value readStream.
	aCallBack
		ifNotNil: [ 
			((self linkObjects
				flatCollect: [ :anObject | (self linkPositionFunction value: anObject) asOrderedCollection collect: [ :int | anObject -> int ] ])
				sorted: [ :asso1 :asso2 | asso1 value first < asso2 value first ])
				do: [ :asso | 
					| interval |
					interval := asso value.
					interval first - source position - 1 > 0
						ifTrue: [ t nextPutAll: (source next: interval first - source position - 1) ].
					t nextPutAll: '['.
					t nextPutAll: (source next: interval last - source position).
					t nextPutAll: '](','aCallBack url',')' ] ].
	t nextPutAll: source upToEnd