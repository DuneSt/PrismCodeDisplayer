demos
stressMinimapDecorationFor: interval
	"One marker per a few lines"
	
	| markers |
	markers := (interval first to: interval last by: 20) collect: [:each |
		PrismMinimapMarker new 
			interval: (each to: each + 20);
			color: Color random; 
			yourself ].
	
	^ PrismMinimapDecoration new 
			interval: interval;
			markers: markers;
			yourself