actions testing
test: aScript	
	self printTestStartOfScript: aScript.
	
	aScript directory: self testDirectory.
		
	[ aScript validate ] 
		ensure: [ self cleanUpAfterScript: aScript ]
	