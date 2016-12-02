as yet unclassified
testProtectCode
	"test to try to solve testHtmlResponseWithProtectedCode fail"
	| res method |
	method := '< this a
string for
testing'. 
   res:=(PrismComponent new) protectCode: method.
	self assert: res equals: '&lt; this a
string for
testing'. "postion of line"