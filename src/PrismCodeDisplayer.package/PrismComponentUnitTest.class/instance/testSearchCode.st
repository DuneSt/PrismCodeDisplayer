tests
testSearchCode
	"test to try to solve testHtmlResponseWithProtectedCode fail"

	| lines component result |
	result := OrderedCollection new
		add: (556 to: 956);
		add: (583 to: 983);
		add: (596 to: 996);
		add: (602 to: 1002);
		yourself.
	component := PrismSearchDecoration new
		setNext:
				(PrismComponent new
						sourceCode: PrismDemos new codeDemoPrism;
						language: #javascript;
						yourself);
		yourself.
	lines := component intervalsLinesFor: 'Prism\.languages\.javascript'.
	self assert: lines equals: result	"postion of line"