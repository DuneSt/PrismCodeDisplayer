rendering
displayComputedSourceCodeOn: t
	| dec |
	t nextPutAll: self sourceCode value.
	"dec := 0.
Halt now.
	self linkObjects do: [ :anObject | | interval text|interval := self linkPositionFunction value: anObject.
		t position: interval first + dec.
		t nextPutAll: '['.
		dec := dec + 1.
		t position: interval last + dec.
		
		text := '](http://url-goes-here.com)'.
		
		t nextPutAll: text.
		dec := dec + text size.]"