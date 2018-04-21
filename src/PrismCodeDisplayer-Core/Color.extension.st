Extension { #name : #Color }

{ #category : #'*PrismCodeDisplayer-Core' }
Color >> asRGBA: anAlpha [
	^ String
		streamContents: [ :s | 
			s
				<< 'rgba(';
				<< (self red * 255) asInteger;
				<< $,;
				<< (self green * 255) asInteger;
				<< $,;
				<< (self blue * 255) asInteger;
				<< $,;
				<< anAlpha asString;
				<< $) ]
]
