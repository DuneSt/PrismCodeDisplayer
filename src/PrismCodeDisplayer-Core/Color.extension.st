Extension { #name : #Color }

{ #category : #'*PrismCodeDisplayer-Core' }
Color >> asRGBA: anAlpha [
	^ String
		streamContents: [ :s | 
			s
				nextPutAll: 'rgba(';
				print: (self red * 255) asInteger;
				nextPut: $,;
				print: (self green * 255) asInteger;
				nextPut: $,;
				print: (self blue * 255) asInteger;
				nextPut: $,;
				nextPutAll: anAlpha asString;
				nextPut: $) ]
]
