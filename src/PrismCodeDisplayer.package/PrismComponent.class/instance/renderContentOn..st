rendering
renderContentOn: html
	| cb component codeId |
	codeId := html nextId.
	component := html preformatted
		class: 'prismComponent';
		class: #'line-numbers';
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