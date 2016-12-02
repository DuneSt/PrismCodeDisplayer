rendering
displayComputedSourceCodeOnUrl: url callBack: aCallBack startLine: start endLine: end
	|  string endCopy offset |
	string := self sourceCode value.
	self intervals: self obtainSortedObjectWithIntervals.
	endCopy := (string intervalOfLine: end) last.
	endCopy = 0
		ifTrue: [ endCopy := string size ].
	offset := (string intervalOfLine: start) first.
	^ ([ 
	{(#html -> (self protectCode: (string copyFrom: offset to: endCopy))).
	(#charOffset -> offset).
	(#start -> start).
	(#intervals -> (self obtainSortedJsInfoWithIntervalsForUrl: url between: offset and: endCopy))} ]
		on: SubscriptOutOfBounds
		do: [ {(#html -> '')} ]) asDictionary