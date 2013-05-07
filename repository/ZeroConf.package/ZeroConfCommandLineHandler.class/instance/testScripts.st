actions testing
testScripts
	self flag: 'Überhack to get the damn Delays working on startup'.
	Delay startTimerEventLoop.
	
	self 
		ensureOSProcess;
		ensureEmptyTestDirectory.
	
	self scripts do: [ :script |
		self test: script ].
	
	self test: self indexScript.