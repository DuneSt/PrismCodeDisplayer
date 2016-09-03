baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/PharoExtras/PrismCodeDisplayer/main/'.
		spec project: 'Seaside3' with: [
				spec
					className: 'ConfigurationOfSeaside3';
					version: #'release3.2';
					repository: 'http://smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main' ].
		spec package: #PrismCodeDisplayer with: [
				spec requires: #('Seaside3' ). ]. ].
