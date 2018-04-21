Class {
	#name : #PrismSensitiveRegexFilter,
	#superclass : #PrismAbstractFilter,
	#category : #'PrismCodeDisplayer-Core-Component'
}

{ #category : #accessing }
PrismSensitiveRegexFilter class >> allRangesFrom: aString for: aPattern [
	^ aPattern asRegex matchingRangesIn: aString
]
