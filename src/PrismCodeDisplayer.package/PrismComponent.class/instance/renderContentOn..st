rendering
renderContentOn: html
	| cb ajax component codeId |
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
	ajax := html jQuery ajax text: [ :t | self displayComputedSourceCodeOn: t url: html actionUrl asString callBack: cb ].
	html script
		defer;
		with:
				(String
						streamContents: [ :s | 
							s
								<<
										'$.ajax({
  url:''';
								<< ajax fullUrl asString;
								<< ''', context:document.getElementById("';
								<< codeId;
								<< '")}).done(function(sourceCode){ this.innerHTML = sourceCode; Prism.highlightElement(this);'.
							self addSelectionListener: component in: s.
							s << ' });' ]).
	self defineMenuFor: component onSelection: html