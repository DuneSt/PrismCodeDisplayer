as yet unclassified
testOutOfBoundHtmtResponse
   | component res method |
   method := TestUtils methodNamed: #codeDemoPrism. 
   component := (PrismComponent new 
				sourceCode: [ method sourceCode ];
				language: #javascript).
				
	res := component displayComputedSourceCodeOnUrl: 'fakeUrl' callBack: nil startLine: 800 endLine: 1200.
	self assert: (res at: #html) equals: ''.