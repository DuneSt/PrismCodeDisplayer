initialization
initialize
	| app |
	app := WAAdmin register: self asApplicationAt: 'PrismDemo'.
	
	app
		addLibrary: PrismLibrary;
		addLibrary: JQDeploymentLibrary.