"
A PrismComponentStrategyTest is a test class for testing the behavior of PrismComponentStrategy
"
Class {
	#name : #PrismComponentStrategyTest,
	#superclass : #TestCase,
	#category : #'PrismCodeDisplayer-Core-Tests'
}

{ #category : #testing }
PrismComponentStrategyTest class >> isAbstract [
	^ self = PrismComponentStrategyTest
]

{ #category : #helpers }
PrismComponentStrategyTest >> actualClass [
	^ self subclassResponsibility
]

{ #category : #tests }
PrismComponentStrategyTest >> testIntervals [
	| strat obj1 obj2 |
	obj1 := Mock named: 'Test1'.
	obj1 stub positions willReturn: {(1 to: 4)}.
	obj2 := Mock named: 'Test2'.
	obj2 stub positions
		willReturn:
			{(10 to: 23).
			(25 to: 32)}.
	strat := self actualClass new
		objects:
			{obj1.
			obj2};
		positionFunction: #positions;
		yourself.
	self assert: strat intervals size equals: 3.
	self
		assertCollection: (strat intervals collect: #interval)
		hasSameElements:
			{(1 to: 4).
			(10 to: 23).
			(25 to: 32)}
]
