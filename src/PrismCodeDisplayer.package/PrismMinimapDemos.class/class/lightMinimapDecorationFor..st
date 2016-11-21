demos
lightMinimapDecorationFor: interval

	^ PrismMinimapDecoration new 
		interval: interval;
		markers: {
			PrismMinimapMarker new 
				interval: ((interval first) to: (interval first + 25));
				color: Color yellow muchLighter; 
				yourself.
			PrismMinimapMarker new 
				interval: ((interval middle - 30) to: (interval middle - 5));
				color: Color red muchLighter; 
				yourself.
			PrismMinimapMarker new 
				interval: ((interval middle + 5) to: (interval middle + 20));
				color: Color green muchLighter;
				yourself.
			PrismMinimapMarker new 
				interval: ((interval last - 50) to: (interval last));
				color: Color purple muchLighter; 
				yourself.
			};
		yourself