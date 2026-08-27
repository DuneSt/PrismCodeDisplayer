Class {
	#name : 'PrismAbstractFilter',
	#superclass : 'Object',
	#category : 'PrismCodeDisplayer-Core-Component',
	#package : 'PrismCodeDisplayer-Core',
	#tag : 'Component'
}

{ #category : 'accessing' }
PrismAbstractFilter class >> allRangesFrom: aString for: aPattern [
	^ self subclassResponsibility
]
