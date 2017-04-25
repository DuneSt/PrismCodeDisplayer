strategies
withSearchBar
	| searchComponent |
	searchComponent := PrismSearchDecoration new.
	self addDecoration: searchComponent.
	self
		addStrategy:
			(PrismComponentStyleStrategy new
				objects: {searchComponent};
				positionFunction: [ :aSearchComponent | aSearchComponent lastSearchResult collect: [ :aInterval | (aInterval at: #start) to: (aInterval at: #end) ] ];
				style: [ :o | 'style="text-decoration: underline; text-decoration-color: #000"' ])