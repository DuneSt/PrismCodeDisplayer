rendering
renderContentOn: html
	| cb component |
	component := html preformatted
		class: 'prismComponent';
		class: #'line-numbers';
		style: 'counter-reset: linenumber ' , (self startCountNumber - 1) asString , ';'.	"We substract one to convert to CSS convention (counting from 0)"
	cb := component storeCallback: (WAValuesCallback on: [ :interval | interval executeCallback ] values: self).
	self
		setDataForCallBack: component
		html: html
		scrollCb: (self defineScrollCallbackOn: component url: html actionUrl menuCallBack: cb)
		clickCb: cb.
	component
		with: [ 
					html code
						class: (self codeClassFor: self language);
						with: 'Waiting' ];
		yourself.
	self defineAjaxMenuFor: component onSelection: html