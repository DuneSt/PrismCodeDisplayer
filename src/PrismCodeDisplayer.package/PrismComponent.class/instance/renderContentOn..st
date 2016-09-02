rendering
renderContentOn: html
	| cb component codeId |
	codeId := html nextId.
	component := html preformatted
		class: 'prismComponent';
		class: #'line-numbers';
		"We substract one to convert to CSS convention (counting from 0)"
		style: 'counter-reset: linenumber ', (self startCountNumber - 1) asString,';';
		id: html nextId;
		with: [ 
					html code
						id: codeId;
						class: (self codeClassFor: self language);
						with: 'Waiting' ];
		yourself.
	self hasCallBack
		ifTrue: [ cb := component storeCallback: (WAValuesCallback on: [ :object | self callBack value: object ] values: self) ].
	html document
		addLoadScript:
			(self
				ajaxInitializationFor: codeId
				callback: cb
				component: component
				on: html).
	self defineMenuFor: component onSelection: html