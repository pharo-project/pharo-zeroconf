actions testing
testScripts	
	self 
		ensureEmptyTestDirectory.
	
	self scripts do: [ :script |
		self test: script ].
	
	self test: self indexScript.