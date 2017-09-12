rendering
renderSearchBarOn: html
	html textInput
		placeholder: 'Prism\.?languages\.?javascript';
		attributeAt: 'autocomplete' put: #off;
		onChange: (self jsOnTextChangeOn: html);
		with: ''.
	html image url: (PrismLibrary urlOf: 'search.png').
	html button
		onClick: self jsOnClickPreviousElement;
		with: 'prev'.
	html button
		onClick: self jsOnClickNextElement;
		with: 'next'.
	self renderCounterOn: html