accessing
setScriptDirectory: script
	script directory ifNil: [ 
		script directory: self outputDirectory ].
	^ script