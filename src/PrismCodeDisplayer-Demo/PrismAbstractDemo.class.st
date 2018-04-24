Class {
	#name : #PrismAbstractDemo,
	#superclass : #WAComponent,
	#category : #'PrismCodeDisplayer-Demo'
}

{ #category : #accessing }
PrismAbstractDemo class >> description [
	^ self subclassResponsibility
]

{ #category : #testing }
PrismAbstractDemo class >> isAbstract [
	^ self = PrismAbstractDemo
]

{ #category : #accessing }
PrismAbstractDemo class >> title [
	^ self subclassResponsibility
]

{ #category : #accessing }
PrismAbstractDemo >> description [
	^ self class description
]

{ #category : #rendering }
PrismAbstractDemo >> renderCodeOfDemoOn: html [
	html heading
		level3;
		with: 'Code:'.
	html div
		class: 'prism-demo-snippet-code';
		with: [ html
				render:
					(PrismComponent new
						sourceCode: [ (self class >> #renderPrismComponentOn:) sourceCode ];
						language: #smalltalk;
						enableCopyOnClick;
						yourself) ]
]

{ #category : #rendering }
PrismAbstractDemo >> renderContentOn: html [
	self renderTitleOn: html.
	html div
		class: 'prism-demo-snippet-group';
		with: [ self renderDemoOn: html.
			self renderCodeOfDemoOn: html ]
]

{ #category : #rendering }
PrismAbstractDemo >> renderDemoOn: html [
	html div
		class: 'prism-demo-snippet-demo';
		with: [ self renderPrismComponentOn: html ]
]

{ #category : #rendering }
PrismAbstractDemo >> renderPrismComponentOn: html [
	^ self subclassResponsibility
]

{ #category : #rendering }
PrismAbstractDemo >> renderTitleOn: html [
	html div
		class: 'prism-demo-page-title';
		with: [ html heading
				level3;
				with: self title.
			html paragraph: self description ]
]

{ #category : #accessing }
PrismAbstractDemo >> title [
	^ self class title
]
