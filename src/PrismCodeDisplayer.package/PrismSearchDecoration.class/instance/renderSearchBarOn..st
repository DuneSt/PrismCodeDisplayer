rendering
renderSearchBarOn: html
	html textInput
		placeholder: 'Prism\.?languages\.?javascript';
		onChange: (self onTextChangeOn: html);
		with: ''.
	html button
		class: 'search-button';
		onClick: self onClickPreviousElement;
		with: 'prev'.
	html button
		class: 'search-button';
		onClick: self onClickNextElement;
		with: 'next'.
	self renderCounterOn: html