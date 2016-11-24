minimap
addMinimapDemoMarkersFrom: startLine to: endLine

	| lineIntervals step |
	step := 5.
	lineIntervals := (startLine to: endLine by: step) collect: [:each | each to: each + step].
	
	self addStrategy: 
		(PrismComponentLinkStrategy new
			objects: lineIntervals;
			positionFunction: [:interval | { 
				(self sourceCode intervalOfLine: interval first - startLine) first to: 
				(self sourceCode intervalOfLine: interval last - startLine) last } ];
			callback: [:interval | ];
			style: [:interval | ];
			miniMapColor: [:interval | Color random ])