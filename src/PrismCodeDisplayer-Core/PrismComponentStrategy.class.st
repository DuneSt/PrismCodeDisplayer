Class {
	#name : #PrismComponentStrategy,
	#superclass : #Object,
	#instVars : [
		'objects',
		'positionFunction',
		'style',
		'miniMapColor',
		'condition'
	],
	#category : #'PrismCodeDisplayer-Core-Component'
}

{ #category : #display }
PrismComponentStrategy >> attributsForUrl: url index: index [
 ^ ''
]

{ #category : #accessing }
PrismComponentStrategy >> condition [
	^ condition ifNil: [ condition := [ true ] ]
]

{ #category : #accessing }
PrismComponentStrategy >> condition: anObject [
	condition := anObject
]

{ #category : #resolution }
PrismComponentStrategy >> intervals [
	^ self objects value
		flatCollect: [ :anObject | 
			(self positionFunction value: anObject) asOrderedCollection
				collect: [ :anInterval | 
					PrismTextInterval new
						strategy: self;
						object: anObject;
						interval: anInterval;
						yourself ] ]
]

{ #category : #accessing }
PrismComponentStrategy >> miniMapColor [
	^ miniMapColor
]

{ #category : #accessing }
PrismComponentStrategy >> miniMapColor: anObject [
	miniMapColor := anObject
]

{ #category : #accessing }
PrismComponentStrategy >> objects [
	^ objects
]

{ #category : #accessing }
PrismComponentStrategy >> objects: anObject [
	objects := anObject
]

{ #category : #accessing }
PrismComponentStrategy >> positionFunction [
	^ positionFunction
]

{ #category : #accessing }
PrismComponentStrategy >> positionFunction: anObject [
	positionFunction := anObject
]

{ #category : #minimpa }
PrismComponentStrategy >> shouldBeDisplayedInMinimap [
	^ self miniMapColor notNil
]

{ #category : #accessing }
PrismComponentStrategy >> style [
	^ style
]

{ #category : #accessing }
PrismComponentStrategy >> style: anObject [
	style := anObject
]

{ #category : #display }
PrismComponentStrategy >> styleString [
 ^(self style value: self) ifNil: [ '' ]
]

{ #category : #display }
PrismComponentStrategy >> styleStringOn: interval [
	^ (self style cull: interval cull: interval object) ifNil: [ '' ]
]

{ #category : #display }
PrismComponentStrategy >> tagForUrl: url index: index [
  ^ '<',self tagName,' ', (self attributsForUrl: url index: index), '', self styleString,'>'
]

{ #category : #display }
PrismComponentStrategy >> tagForUrl: url index: index  on: interval [
  ^ '<',self tagName,' ', (self attributsForUrl: url index: index), '', (self styleStringOn:interval),'>'
]

{ #category : #display }
PrismComponentStrategy >> tagName [
 ^ self subclassResponsibility 
]
