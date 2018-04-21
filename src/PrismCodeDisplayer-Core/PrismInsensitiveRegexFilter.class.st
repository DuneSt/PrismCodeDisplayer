Class {
	#name : #PrismInsensitiveRegexFilter,
	#superclass : #PrismAbstractFilter,
	#category : #'PrismCodeDisplayer-Core-Component'
}

{ #category : #accessing }
PrismInsensitiveRegexFilter class >> allRangesFrom: aString for: aPattern [
	^ aPattern asRegexIgnoringCase matchingRangesIn: aString
]
