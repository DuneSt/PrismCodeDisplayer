Class {
	#name : #PrismAbstractDemo,
	#superclass : #Object,
	#category : #'PrismCodeDisplayer-Demo'
}

{ #category : #testing }
PrismAbstractDemo class >> isAbstract [
	^ self = PrismAbstractDemo
]

{ #category : #accessing }
PrismAbstractDemo class >> title [
	^ self subclassResponsibility
]

{ #category : #rendering }
PrismAbstractDemo >> renderDemoOn: html [
	self subclassResponsibility
]

{ #category : #accessing }
PrismAbstractDemo >> title [
	^ self class title
]
