actions testing
ensureOSProcess
	Smalltalk globals at: #OSProcess ifPresent: [ ^ self ].
	
	self stderr yellow: 'Loading CommandShell...'; lf.
	Gofer new
		squeaksource: 'MetacelloRepository';
		configurationOf: 'CommandShell';
		loadStable.