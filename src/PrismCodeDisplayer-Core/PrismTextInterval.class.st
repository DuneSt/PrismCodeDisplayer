Class {
	#name : #PrismTextInterval,
	#superclass : #Object,
	#instVars : [
		'strategy',
		'object',
		'interval'
	],
	#category : #'PrismCodeDisplayer-Core-Component'
}

{ #category : #callback }
PrismTextInterval >> executeCallback [
	self strategy executeCallbackFor: self object.
]

{ #category : #position }
PrismTextInterval >> extent [
	^ self interval extent
]

{ #category : #position }
PrismTextInterval >> first [
	^ self interval first
]

{ #category : #accessing }
PrismTextInterval >> interval [
	^ interval
]

{ #category : #accessing }
PrismTextInterval >> interval: anObject [
	interval := anObject
]

{ #category : #position }
PrismTextInterval >> last [
	^ self interval last
]

{ #category : #accessing }
PrismTextInterval >> miniMapColor [
	^ self strategy miniMapColor 
		ifNil: [ nil ]
		ifNotNil: [ :block | block cull: self cull: self object ]
]

{ #category : #accessing }
PrismTextInterval >> object [
	^ object
]

{ #category : #accessing }
PrismTextInterval >> object: anObject [
	object := anObject
]

{ #category : #minimap }
PrismTextInterval >> shouldBeDisplayedInMinimap [
	^ self strategy shouldBeDisplayedInMinimap
]

{ #category : #accessing }
PrismTextInterval >> strategy [
	^ strategy
]

{ #category : #accessing }
PrismTextInterval >> strategy: anObject [
	strategy := anObject
]

{ #category : #'as yet unclassified' }
PrismTextInterval >> tag [
	^ self strategy tag
]

{ #category : #'as yet unclassified' }
PrismTextInterval >> tagForUrl: url [
	^ self strategy tagForUrl: url
]

{ #category : #'as yet unclassified' }
PrismTextInterval >> tagForUrl: url index: index [ 
	^ self strategy tagForUrl: url index: index on:self
]
