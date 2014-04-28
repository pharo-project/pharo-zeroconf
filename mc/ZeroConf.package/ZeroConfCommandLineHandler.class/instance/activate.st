activation
activate
	self activateHelp
		ifTrue: [ ^ self ].
	
	self outputDirectory ensureCreateDirectory.
	
	(self hasOption: 'test')
		ifTrue: [ self testScripts ]
		ifFalse:[ self generateScripts ].
	
	self
		exitSuccess