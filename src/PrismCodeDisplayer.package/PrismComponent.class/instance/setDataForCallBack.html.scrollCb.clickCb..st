callback
setDataForCallBack: div html: html scrollCb: scrollCb clickCb: clickCb
	self flag: #TODO.	"Remove hard coded values"
	div
		attributeAt: 'data-totallines' asSymbol put: self sourceCode value lineCount asString ;
		attributeAt: 'data-url' asSymbol put: html actionUrl asString;
		attributeAt: 'data-cbId' asSymbol put: scrollCb asString;
		attributeAt: 'data-lclickCb' asSymbol put: clickCb;
		attributeAt: 'data-lastindexasked' asSymbol put: -1 asString;
		attributeAt: 'data-lastindexloaded' asSymbol put: -1 asString;
		attributeAt: 'data-firstindex' asSymbol put: -1 asString;
		attributeAt: 'data-lastindex' asSymbol put: 400 asString;
		attributeAt: 'data-startcountnumber' asSymbol put: (self startCountNumber - 1) asString;
		attributeAt: 'data-protectcrlf' asSymbol put: self isProtectedToCRLF asString
		"We substract one to convert to CSS convention (counting from 0)"