rendering
displayComputedSourceCodeOnUrl: url callBack: aCallBack startLine: start endLine: end
	| source string endCopy offset |
	string := String
		streamContents: [ :stream | 
			source := self sourceCode value readStream.
			self intervals: self obtainSortedObjectWithIntervals.
			stream nextPutAll: (self protectCode: source upToEnd) ].
	endCopy := (string intervalOfLine: end) last.
	endCopy = 0
		ifTrue: [ endCopy := string size ].
	offset := (string intervalOfLine: start) first.
	^ {(#html
		->
			([ string copyFrom: offset to: endCopy ]
				on: SubscriptOutOfBounds
				do: [ string copyFrom: ((string intervalOfLine: start) first max: 1) to: string size ])).
	(#charOffset -> offset).
	(#start -> start).
	(#intervals -> (self obtainSortedJsInfoWithIntervalsForUrl: url between: offset and: endCopy))} asDictionary