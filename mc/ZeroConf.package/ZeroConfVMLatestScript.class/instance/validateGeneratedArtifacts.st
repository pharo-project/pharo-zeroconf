validation
validateGeneratedArtifacts
	| command |
	super validateGeneratedArtifacts.
	
	command := (self directory / self type) fullName, ' ',self optionDash,'help'.
	self 
		assert: (OSProcess waitForCommand: command) succeeded
		description: command, ' did not run properly.' 