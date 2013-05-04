actions testing
test: aScript	
	self generate: aScript in: self testDirectory.
	self testValidateGeneratedFileOfScript: aScript.
	self testRunScript: aScript.
	self cleanUpAfterScript: aScript.