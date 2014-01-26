accessing
directory
	^ directory ifNil: [ self defaultDirectory ]