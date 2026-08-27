Class {
	#name : 'PrismInsensitiveRegexFilter',
	#superclass : 'PrismAbstractFilter',
	#category : 'PrismCodeDisplayer-Core-Component',
	#package : 'PrismCodeDisplayer-Core',
	#tag : 'Component'
}

{ #category : 'accessing' }
PrismInsensitiveRegexFilter class >> allRangesFrom: aString for: aPattern [
	^ aPattern asRegexIgnoringCase matchingRangesIn: aString
]
