Class {
	#name : #PrismAbstractDecoration,
	#superclass : #WADecoration,
	#category : 'PrismCodeDisplayer-Component'
}

{ #category : #accessing }
PrismAbstractDecoration >> lineCount [
	^ self decoratedComponent lineCount
]

{ #category : #action }
PrismAbstractDecoration >> resetSortedObjectWithIntervals [
	self decoratedComponent computeSortedObjectWithIntervals
]

{ #category : #accessing }
PrismAbstractDecoration >> sourceCode [
	^ self decoratedComponent sourceCode 
]
