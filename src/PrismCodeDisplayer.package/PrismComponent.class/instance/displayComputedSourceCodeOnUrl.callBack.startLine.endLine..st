rendering
displayComputedSourceCodeOnUrl: url callBack: aCallBack startLine: start endLine: end
	| string endCopy offset |
	string := self sourceCode value.
	string isEmptyOrNil
		ifTrue: [ ^ Dictionary with: #html -> 'Error: No source to display.' ].
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
		on: Error
		do: [ {(#html -> 'Sorry but an error occured')} ]) asDictionary