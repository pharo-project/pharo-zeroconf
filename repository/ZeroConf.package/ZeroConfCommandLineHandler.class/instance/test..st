actions testing
test: aScript	
	self 
		generate: aScript in: self testDirectory;
		validateGeneratedFileOfScript: aScript;
		validateOutputOfScript: aScript;
		cleanUpAfterScript: aScript.