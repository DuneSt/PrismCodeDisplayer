initialization
initialize
	super initialize.
	self startCountNumber: 1.
	self strategies: OrderedCollection new.
	protectToCRLF := false