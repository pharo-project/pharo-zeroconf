accessing
setScriptDirectory: script
	script baseDirectory ifNil: [ 
		script directory: self outputDirectory ].
	^ script