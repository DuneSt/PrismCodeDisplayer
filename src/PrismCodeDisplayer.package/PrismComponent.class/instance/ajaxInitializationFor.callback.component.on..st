javascript
ajaxInitializationFor: codeId callback: cb component: component on: html
	^ html jQuery ajax
		context: (JSStream on: 'document.getElementById(''' , codeId , ''')');
		script: [ :s | 
					s
						<<
							((html jQuery id: codeId) load
								text: [ :t | self displayComputedSourceCodeOn: t url: html actionUrl asString callBack: cb  startLine: 1 endLine: 400 ];
								onComplete:
										(String
												streamContents: [ :sc | 
													sc << 'Prism.highlightElement(this);'.
													self jsOnLoadHook isEmptyOrNil
														ifFalse: [ sc << self jsOnLoadHook ].
													self addSelectionListener: component in: sc ])) ]