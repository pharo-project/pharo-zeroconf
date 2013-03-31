helper
runScriptTest: aScript
	script := aScript.
	self 
		generateTest;
		helpTest;
		runTest;
		cleanUp.