accessing
defaultBasename
	^ version 
		ifNil: [ self release asString ]