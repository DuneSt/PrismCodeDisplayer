rendering
displayComputedSourceCodeOn: t url: url callBack: aCallBack startLine: start endLine: end
	| source string endCopy |
	self flag: 'dead code'.
	string := String
		streamContents: [ :stream | 
			source := self sourceCode value readStream.
			self intervals: self obtainSortedObjectWithIntervals.
			self intervals
				doWithIndex: [ :interval :index | 
					interval last - source position > 0
						ifTrue: [ 
							interval first - source position - 1 > 0
								ifTrue: [ stream nextPutAll: (self protectCode: (source next: interval first - source position - 1)) ].
							stream
								nextPutAll: 'ế';
								nextPutAll: (self protectCode: (source next: interval last - source position));
								nextPutAll: 'ề(';
								nextPutAll: url;
								nextPut: $#;
								nextPutAll: aCallBack;
								nextPut: $#;
								nextPutAll: index asString;
								nextPut: $) ] ].
			stream nextPutAll: (self protectCode: source upToEnd) ].
	endCopy := (string intervalOfLine: end) last.
	(endCopy= 0) ifTrue: [endCopy:= string size].
	t
		nextPutAll:
			([ string copyFrom: (string intervalOfLine: start) first to: endCopy]
				on: SubscriptOutOfBounds
				do: [ string copyFrom: ((string intervalOfLine: start) first max: 1) to: string size ]).
		self halt.