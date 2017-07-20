rendering
renderSearchBarOn: html
	html textInput
		placeholder: 'Prism\.?languages\.?javascript';
		attributeAt: 'autocomplete' put: #off;
		onChange: (self onTextChangeOn: html);
		with: ''.
	html image url: (PrismLibrary urlOf: 'search.png').
	html button
		onClick: self onClickPreviousElement;
		with: 'prev'.
	html button
		onClick: self onClickNextElement;
		with: 'next'.
	self renderCounterOn: html