accessing
directory
	^ directory ifNil: [ FileLocator workingDirectory ]