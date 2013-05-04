actions testing
testScripts
	
	self 
		ensureOSProcess;
		ensureEmptyTestDirectory.
	
	self scripts do: [ :script |
		self test: script ].
	
	self test: self indexScript.