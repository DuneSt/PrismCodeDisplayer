menu
addMenu: aString action: aBlockClosure if: aBlockOrBool
	aBlockOrBool value
		ifTrue: [ self addMenu: aString action: aBlockClosure ]