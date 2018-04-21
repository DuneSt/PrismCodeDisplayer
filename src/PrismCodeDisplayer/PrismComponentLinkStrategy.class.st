Class {
	#name : #PrismComponentLinkStrategy,
	#superclass : #PrismComponentStrategy,
	#instVars : [
		'callback'
	],
	#category : 'PrismCodeDisplayer-Component'
}

{ #category : #display }
PrismComponentLinkStrategy >> attributsForUrl: url index: index [
  ^ 'href="javascript:void(0)" onclick=''t={};t[$(this).closest(".prismComponent")[0].dataset.lclickcb]=',index asString,';post("',url asString, '",t)'''
]

{ #category : #accessing }
PrismComponentLinkStrategy >> callback [
	^ callback
]

{ #category : #accessing }
PrismComponentLinkStrategy >> callback: anObject [
	callback := anObject
]

{ #category : #'as yet unclassified' }
PrismComponentLinkStrategy >> executeCallbackFor: anObject [
	self callback value: anObject
]

{ #category : #display }
PrismComponentLinkStrategy >> tagName [
  ^ #a
]
