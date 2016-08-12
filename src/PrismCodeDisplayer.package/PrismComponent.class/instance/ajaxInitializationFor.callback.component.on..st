javascript
ajaxInitializationFor: codeId callback: cb component: component on: html
	^ html jQuery ajax
		context: (JSStream on: 'document.getElementById(''' , codeId , ''')');
		script: [ :s | 
					s
						<<
							((html jQuery id: codeId) load
								text: [ :t | self displayComputedSourceCodeOn: t url: html actionUrl asString callBack: cb ];
								onComplete:
										(String
												streamContents: [ :sc | 
													sc << 'Prism.highlightElement(this);'.
													self addSelectionListener: component in: sc ])) ]