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
				materialDesignLite: spec;
				mocketry: spec;
				seaside3: spec.

			"Packages"
			spec
				package: 'PrismCodeDisplayer-Core' with: [ spec requires: #('PrismCodeDisplayer-Library') ];
				package: 'PrismCodeDisplayer-Library' with: [ spec requires: #('Seaside3') ];
				package: 'PrismCodeDisplayer-Demo' with: [ spec requires: #('PrismCodeDisplayer-Core') ];
				package: 'PrismCodeDisplayer-Core-Tests' with: [ spec requires: #('PrismCodeDisplayer-Core' 'Mocketry') ];
				package: 'PrismCodeDisplayer-MaterialDesignLite' with: [ spec requires: #('PrismCodeDisplayer-Core' 'MaterialDesignLite') ].

			"Groups"
			spec
				group: 'all' with: #('default' 'mdl');
				group: 'core' with: #('PrismCodeDisplayer-Core');
				group: 'default' with: #('core' 'demo' 'tests');
				group: 'demo' with: #('PrismCodeDisplayer-Demo');
				group: 'mdl' with: #('PrismCodeDisplayer-MaterialDesignLite');
				group: 'tests' with: #('PrismCodeDisplayer-Core-Tests') ]
]

{ #category : #dependencies }
BaselineOfPrismCodeDisplayer >> materialDesignLite: spec [
	spec
		baseline: 'MaterialDesignLite'
		with: [ spec
				loads: #('core');
				repository: 'github://DuneSt/MaterialDesignLite:v2.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfPrismCodeDisplayer >> mocketry: spec [
	spec baseline: 'Mocketry' with: [ spec repository: 'github://dionisiydk/Mocketry:v6.0.x' ]
]

{ #category : #accessing }
BaselineOfPrismCodeDisplayer >> projectClass [
	^ [ self class environment at: #MetacelloCypressBaselineProject ]
		on: NotFound
		do: [ super projectClass ]
]

{ #category : #dependencies }
BaselineOfPrismCodeDisplayer >> seaside3: spec [
	spec
		baseline: 'Seaside3'
		with: [ spec
				loads: #('Core' 'JQuery' 'Zinc');
				repository: 'github://SeasideSt/Seaside:v3.3.x/repository' ]
]
