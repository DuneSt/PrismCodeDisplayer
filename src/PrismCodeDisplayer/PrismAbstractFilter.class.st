Class {
	#name : #PrismAbstractFilter,
	#superclass : #Object,
	#category : 'PrismCodeDisplayer-Component'
}

{ #category : #accessing }
PrismAbstractFilter class >> allRangesFrom: aString for: aPattern [
	^ self subclassResponsibility
]
