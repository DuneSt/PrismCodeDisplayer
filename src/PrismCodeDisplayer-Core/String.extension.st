Extension { #name : #String }

{ #category : #'*PrismCodeDisplayer-Core' }
String >> prismIntervalOfLine: aLineNumber [
	"Answer an interval spanning between the first and the last character of the line from aLineNumber.
	
	I am named #prismIntervalOfLine: because #intervalOfLine: is already implemented in some external project. It's to avoid name conflict.
	"

	| lineIndex |
	lineIndex := 0.
	self
		lineIndicesDo: [ :start :endWithoutDelimiters :end | 
			lineIndex := lineIndex + 1.
			lineIndex = aLineNumber
				ifTrue: [ ^ start to: end ] ].
	^ 0 to: 0
]
