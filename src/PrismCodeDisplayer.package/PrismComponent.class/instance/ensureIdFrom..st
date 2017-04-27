accessing
ensureIdFrom: html
	self id ifNil: [ self id: html nextId ]