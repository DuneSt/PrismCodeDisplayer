accessing
intervalsToBeDisplayedInMinimap
	^ self next intervals ifNil: [ {} ] ifNotNil: [ :intervs | intervs select: #shouldBeDisplayedInMinimap ]