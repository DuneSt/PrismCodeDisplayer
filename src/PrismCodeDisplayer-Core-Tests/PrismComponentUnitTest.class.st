Class {
	#name : #PrismComponentUnitTest,
	#superclass : #TestCase,
	#category : #'PrismCodeDisplayer-Core-Tests'
}

{ #category : #tests }
PrismComponentUnitTest >> testHtmlResponse [
	| method component res |
	method := 'this a
string for
testing'.
	component := PrismComponent new
		sourceCode: [ method ];
		language: #javascript.
	res := component
		displayComputedSourceCodeOnUrl: 'fakeUrl'
		callBack: nil
		startLine: 2
		endLine: 2.
	self
		assert: (res at: #html) asSymbol
		equals:
			#'string for
'.
	self assert: (res at: #charOffset) equals: 8.	"postion of first char"
	self assert: (res at: #start) equals: 2	"postion of line"
]

{ #category : #tests }
PrismComponentUnitTest >> testHtmlResponseWithProtectedCode [
	| component res method |
	method := '< this a
string for
testing'.
	component := PrismComponent new
		sourceCode: [ method ];
		language: #javascript.
	res := component
		displayComputedSourceCodeOnUrl: 'fakeUrl'
		callBack: nil
		startLine: 2
		endLine: 2.
	self
		assert: (res at: #html) asSymbol
		equals:
			#'string for
'.
	self assert: (res at: #charOffset) equals: 10.	"postion of first char"
	self assert: (res at: #start) equals: 2	"postion of line"
]

{ #category : #tests }
PrismComponentUnitTest >> testProtectCode [
	"test to try to solve testHtmlResponseWithProtectedCode fail"

	| res method |
	method := '< this a
string for
testing'.
	res := PrismComponent new protectCode: method.
	self
		assert: res
		equals:
			'&lt; this a
string for
testing'	"postion of line"
]

{ #category : #tests }
PrismComponentUnitTest >> testSearchCode [
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
]
