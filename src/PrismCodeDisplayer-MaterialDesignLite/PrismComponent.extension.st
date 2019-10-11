Extension { #name : #PrismComponent }

{ #category : #'*PrismCodeDisplayer-MaterialDesignLite' }
PrismComponent >> withMDLSearchBar [
	| searchComponent |
	searchComponent := PrismMDLSearchDecoration new.
	self addDecoration: searchComponent.
	self
		addStrategy:
			(PrismComponentStyleStrategy new
				objects: {searchComponent};
				positionFunction: [ :aSearchComponent | aSearchComponent lastSearchResult collect: [ :aInterval | (aInterval at: #start) to: (aInterval at: #end) ] ];
				style: [ :o | 'style="border-bottom: 6px solid #f44336 "' ])
]
