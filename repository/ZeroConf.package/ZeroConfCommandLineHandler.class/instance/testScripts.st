actions testing
testScripts
	
	self 
		ensureOSProcess;
		ensureEmptyTestDirectory.
	
	self scripts 
		reject: [ :script | 
			"cannot test combined scripts as they download the other scripts from the server	which most probably are still using the old data. Hence they might produce outdated	artifacts."
			script isCombined ]
		thenDo: [ :script |	self test: script ].
	
	self test: self indexScript.