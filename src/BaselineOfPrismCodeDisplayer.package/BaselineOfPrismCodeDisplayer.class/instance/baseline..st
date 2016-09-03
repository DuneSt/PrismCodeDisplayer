baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ self seaside30: spec.
			spec package: #PrismCodeDisplayer with: [ spec requires: #('Seaside30') ] ]