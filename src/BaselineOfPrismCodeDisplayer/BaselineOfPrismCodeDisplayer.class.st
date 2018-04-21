"
I am a baseline of ChartJs for Seaside. Read more at: https://github.com/DuneSt/PrismCodeDisplayer
"
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
		do: [ 
			
			"Dependencies"
			self
				seaside3: spec;
				neoJSON: spec.

			"Packages"
			spec
				package: #'PrismCodeDisplayer-Core' with: [ spec requires: #('NeoJSON' 'PrismCodeDisplayer-Library') ];
				package: #'PrismCodeDisplayer-Library' with: [ spec requires: #('Seaside3') ];
				package: #'PrismCodeDisplayer-Demo' with: [ spec requires: #('PrismCodeDisplayer-Core') ];
				package: #'PrismCodeDisplayer-Core-Tests' with: [ spec requires: #('PrismCodeDisplayer-Core') ].

			"Groups"
			spec
				group: 'all' with: #('default');
				group: 'core' with: #('PrismCodeDisplayer-Core');
				group: 'default' with: #('core' 'demo' 'tests');
				group: 'demo' with: #('PrismCodeDisplayer-Demo');
				group: 'tests' with: #('PrismCodeDisplayer-Core-Tests') ]
]

{ #category : #dependencies }
BaselineOfPrismCodeDisplayer >> neoJSON: spec [
	spec
		configuration: 'NeoJSON'
		with: [ spec
				className: 'ConfigurationOfNeoJSON';
				version: #stable;
				repository: 'http://smalltalkhub.com/mc/SvenVanCaekenberghe/Neo/main' ]
]

{ #category : #accessing }
BaselineOfPrismCodeDisplayer >> projectClass [
	^ [ self class environment at: #MetacelloCypressBaselineProject ]
		on: NotFound
		do: [ super projectClass ]
]

{ #category : #dependencies }
BaselineOfPrismCodeDisplayer >> seaside3: spec [
	spec baseline: 'Seaside3' with: [ spec repository: 'github://SeasideSt/Seaside/repository' ]
]
