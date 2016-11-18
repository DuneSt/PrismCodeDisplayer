rendering
displayComputedSourceCodeOnUrl: url callBack: aCallBack startLine: start endLine: end
	| source string endCopy |
	self flag: 'dead code'.
	string := String
		streamContents: [ :stream | 
			source := self sourceCode value readStream.
			self intervals: self obtainSortedObjectWithIntervals.
			stream nextPutAll: (self protectCode: source upToEnd) ].
	endCopy := (string intervalOfLine: end) last.
	(endCopy= 0) ifTrue: [endCopy:= string size].
	^([ string copyFrom: (string  intervalOfLine: start) first to: endCopy]
				on: SubscriptOutOfBounds
				do: [ string copyFrom: ((string  intervalOfLine: start) first max: 1) to: string  size ]).