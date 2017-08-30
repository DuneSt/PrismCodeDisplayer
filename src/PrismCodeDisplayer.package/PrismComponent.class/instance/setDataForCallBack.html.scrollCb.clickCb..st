callback
setDataForCallBack: div html: html scrollCb: scrollCb clickCb: clickCb
	self flag: #TODO.	"Remove hard coded values"
	div
		attributeAt: #'data-totallines' put: self lineCount asString;
		attributeAt: #'data-url' put: html actionUrl asString;
		attributeAt: #'data-cbId' put: scrollCb asString;
		attributeAt: #'data-lclickCb' put: clickCb;
		attributeAt: #'data-lastindexasked' put: -1 asString;
		attributeAt: #'data-lastindexloaded' put: self lastIndexLoad ;
		attributeAt: #'data-firstindex' put: -1 asString;
		attributeAt: #'data-lastindex' put: self lastIndexLoad;
		attributeAt: #'data-startcountnumber' put: (self startCountNumber - 1) asString;"We substract one to convert to CSS convention (counting from 0)"
		attributeAt: #'data-onloadhook' put: (self jsOnLoadHook ifNil: [ '' ]);	
		attributeAt: #'data-onchangehook' put: (self jsOnChangeHook ifNil: [ '' ])	