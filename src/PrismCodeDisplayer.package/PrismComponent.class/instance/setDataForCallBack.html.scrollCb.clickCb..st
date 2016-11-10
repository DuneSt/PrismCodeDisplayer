callback
setDataForCallBack: div html: html scrollCb: scrollCb clickCb: clickCb
	self flag: #TODO. "Remove hard coded values"
	div
		attributeAt: 'data-url' asSymbol put: html actionUrl asString;
		attributeAt: 'data-cbId' asSymbol put: scrollCb asString;
		attributeAt: 'data-lclickCb' asSymbol put: clickCb;
		attributeAt: 'data-lastIndexAsked' asSymbol put: 1 asString;
		attributeAt: 'data-lastIndexLoaded' asSymbol put: 1 asString;
		attributeAt: 'data-firstIndex' asSymbol put: 1 asString;
		attributeAt: 'data-lastIndex' asSymbol put: 400 asString