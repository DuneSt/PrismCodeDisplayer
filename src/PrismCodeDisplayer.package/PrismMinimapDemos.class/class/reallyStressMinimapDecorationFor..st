demos
reallyStressMinimapDecorationFor: interval
	"One marker per line"
	
	| markers |
	markers := interval collect: [:each |
		PrismMinimapMarker new 
			interval: (each to: each+1);
			color: Color random; 
			yourself ].
	
	^ PrismMinimapDecoration new 
			interval: interval;
			markers: markers;
			yourself