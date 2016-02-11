rendering
renderContentOn: html
	| codeId ajax |
	codeId := html nextId.
	html preformatted
		class: #'line-numbers';
		with: [ 
					html code
						id: codeId;
						class: (self codeClassFor: self language);
						with: 'Waiting' ].
	ajax := (html jQuery ajax text: [ :t | self displayComputedSourceCodeOn: t ]).
	html script: '$.ajax({
  url:''' , ajax fullUrl asString, ''', context:document.getElementById("' , codeId , '")}).done(function(sourceCode){ this.innerHTML = sourceCode; Prism.highlightElement(this);  });'