Class {
	#name : #BaselineOfPrismCodeDisplayer,
	#superclass : #BaselineOf,
	#category : #BaselineOfPrismCodeDisplayer
}

{ #category : #baseline }
BaselineOfPrismCodeDisplayer >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self seaside30: spec.
			spec package: #PrismCodeDisplayer with: [ spec requires: #('Seaside30') ] ]
]

{ #category : #accessing }
BaselineOfPrismCodeDisplayer >> projectClass [
	self flag: #clean.	"This is a hack that need to be remove after the default version of Metacello includes Cypress suport."
	^ [ #MetacelloCypressBaselineProject asClass ]
		on: NotFound
		do: [ Metacello new
				baseline: 'Metacello';
				repository: 'github://dalehenrich/metacello-work:master/repository';
				get.
			Metacello new
				baseline: 'Metacello';
				repository: 'github://dalehenrich/metacello-work:master/repository';
				onConflict: [ :ex | ex allow ];
				load.
			self projectClass ]
]

{ #category : #dependencies }
BaselineOfPrismCodeDisplayer >> seaside30: spec [
	spec
		configuration: 'Seaside30'
		with: [ spec
				className: 'ConfigurationOfSeaside3';
				version: #'release3.2';
				repository: 'http://smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main' ]
]
