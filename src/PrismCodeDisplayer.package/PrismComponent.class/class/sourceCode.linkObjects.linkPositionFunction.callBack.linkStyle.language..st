as yet unclassified
sourceCode: aSourceText linkObjects: aCollectionOfObject linkPositionFunction: aFunctionReturningInterval callBack: aBlockToExecture linkStyle: aStyleCssClass language: aCodeLanguage
	^ self new
		sourceCode: aSourceText;
		addStrategy:
				(PrismComponentLinkStrategy new
						objects: aCollectionOfObject;
						positionFunction: aFunctionReturningInterval;
						callback: aBlockToExecture;
						style: aStyleCssClass);
		language: aCodeLanguage;
		yourself