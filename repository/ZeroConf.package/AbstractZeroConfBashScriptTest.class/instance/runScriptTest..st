helper
runScriptTest: aScript
	| testDirectory |
	script := aScript.
	testDirectory := 'zeroconf-test' asFileReference.
	testDirectory ensureDeleteAll; ensureCreateDirectory.
	script directory: testDirectory.
	self 
		generateTest;
		helpTest;
		runTest;
		cleanUp.