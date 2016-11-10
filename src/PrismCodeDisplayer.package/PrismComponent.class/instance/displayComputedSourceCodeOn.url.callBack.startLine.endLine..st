rendering
displayComputedSourceCodeOn: t url: url callBack: aCallBack startLine: start endLine: end
	| source string |
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
	t
		nextPutAll:
			([ string copyFrom: (string intervalOfLine: start) first to: (string intervalOfLine: end) last ]
				on: SubscriptOutOfBounds
				do: [ string copyFrom: ((string intervalOfLine: start) first max: 1) to: string size ])