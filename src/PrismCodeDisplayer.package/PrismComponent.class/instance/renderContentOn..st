rendering
renderContentOn: html
	| cb ajax component codeId |
	codeId := html nextId.
	component := html preformatted
		class: 'prismComponent';
		class: #'line-numbers';
		with: [ 
					html code
						id: codeId;
						class: (self codeClassFor: self language);
						with: 'Waiting' ];
		yourself.
	self hasCallBack
		ifTrue: [ cb := component storeCallback: (WAValuesCallback on: [ :object | self callBack value: object ] values: self) ].
	ajax := html jQuery ajax text: [ :t | self displayComputedSourceCodeOn: t url: html actionUrl asString callBack: cb ].
	html
		script:
			'$.ajax({
  url:''' , ajax fullUrl asString , ''', context:document.getElementById("' , codeId
				, '")}).done(function(sourceCode){ this.innerHTML = sourceCode; Prism.highlightElement(this);  });'