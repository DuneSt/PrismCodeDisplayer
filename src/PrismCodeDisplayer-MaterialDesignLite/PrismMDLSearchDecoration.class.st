"
I am a search decoration for Prism using MDL to display the icons.

You can use me by calling #withMDLSearchBar on a PrismCodeDisplayerComponent.

Do not forget to add the MDL library and css file to your application for me to have a nice style.
"
Class {
	#name : #PrismMDLSearchDecoration,
	#superclass : #PrismSearchDecoration,
	#category : #'PrismCodeDisplayer-MaterialDesignLite'
}

{ #category : #hook }
PrismMDLSearchDecoration >> hookClass [
	^ 'mdl-shadow--2dp'
]

{ #category : #rendering }
PrismMDLSearchDecoration >> renderSearchBarOn: html [
	html mdlTextFieldContainer
		style: 'padding: 0;';
		onChange: (self jsOnTextChangeOn: html);
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: 'Search'.
			html mdlTextFieldInput
				id: html lastId;
				attributeAt: 'placeholder' put: 'Prism\.?languages\.?javascript';
				attributeAt: 'autocomplete' put: #off;
				type: 'text' ].
	html mdlButton icon: #search.
	html mdlButton
		class: 'search-button';
		onClick: self jsOnClickPreviousElement;
		icon: #keyboard_arrow_up.
	html mdlButton
		class: 'search-button';
		onClick: self jsOnClickNextElement;
		icon: #keyboard_arrow_down.
	self renderCounterOn: html
]
