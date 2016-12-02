as yet unclassified
testHtmlResponse
   | component res|
   method := 'this a
string for
testing'. 
   component := (PrismComponent new
				sourceCode: [ method  ];
				language: #javascript).
				
	res := component displayComputedSourceCodeOnUrl: 'fakeUrl' callBack: nil startLine: 2 endLine: 2.
	self assert: (res at: #html ) asSymbol  equals:  #'string for
'.
	self assert: (res at: #charOffset) equals: 8. "postion of first char"
	self assert: (res at: #start) equals: 2. "postion of line"