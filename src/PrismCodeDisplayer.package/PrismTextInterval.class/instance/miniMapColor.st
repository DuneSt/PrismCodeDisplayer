accessing
miniMapColor
	^ self strategy miniMapColor 
		ifNil: [ nil ]
		ifNotNil: [ :block | block cull: self ]