tests
testSearchCode
	"test to try to solve testHtmlResponseWithProtectedCode fail"

	| lines component result |
	result := OrderedCollection new
		add: {#end->15809. #line->656. #start->15784.} asDictionary ;
		add: {#end->16963. #line->683. #start->16938.} asDictionary;
		add: {#end->17219. #line->696. #start->17194.} asDictionary;
		add: {#end->17312. #line->702. #start->17287.} asDictionary;
		yourself.
	component := PrismSearchDecoration new
		setNext:
				(PrismComponent new
						sourceCode: PrismDemos new codeDemoPrism;
						language: #javascript;
						yourself);
		yourself.
	lines := component linesMatcheTo: 'Prism\.languages\.javascript'.
	self assert: lines equals: result	"postion of line"