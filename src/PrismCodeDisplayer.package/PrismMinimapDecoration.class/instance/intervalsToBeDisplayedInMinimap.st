accessing
intervalsToBeDisplayedInMinimap
	^ self decoratedComponent intervals ifNil: [ {} ] ifNotNil: [ :intervs | intervs select: #shouldBeDisplayedInMinimap ]