rendering
renderContentOn: html
	| cb component codeId |
	codeId := html nextId.
	component := html preformatted
		class: 'prismComponent';
		class: #'line-numbers';
		style: 'counter-reset: linenumber ' , (self startCountNumber - 1) asString , ';';
		id: html nextId.	"We substract one to convert to CSS convention (counting from 0)"
	cb := component storeCallback: (WAValuesCallback on: [ :interval | interval executeCallback ] values: self).
	self
		setDataForCallBack: component
		html: html
		scrollCb: (self defineScrollCallbackOn: component)
		clickCb: cb.
	component
		with: [ 
					html code
						id: codeId;
						class: (self codeClassFor: self language);
						with: 'Waiting' ];
		yourself.
	html document
		addLoadScript:
			(self
				ajaxInitializationFor: codeId
				callback: cb
				component: component
				on: html).
	self defineMenuFor: component onSelection: html