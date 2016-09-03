rendering
renderContentOn: html
	| codeId ajax component cb |
	codeId := html nextId.
	component := html preformatted
		class: #'line-numbers';
		with: [ 
					html code
						id: codeId;
						class: (self codeClassFor: self language);
						with: 'Waiting' ];
		yourself.
	self hasCallBack
		ifTrue: [ cb := component storeCallback: (WAValuesCallback on: [ :object | self callBack value: object ] values: self linkObjects) ].
	ajax := html jQuery ajax text: [ :t | self displayComputedSourceCodeOn: t callBack: cb ].
	html
		script:
			'$.ajax({
  url:''' , ajax fullUrl asString , ''', context:document.getElementById("' , codeId
				, '")}).done(function(sourceCode){ this.innerHTML = sourceCode; Prism.highlightElement(this);  });'