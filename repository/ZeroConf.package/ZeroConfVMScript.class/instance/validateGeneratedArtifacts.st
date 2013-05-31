validation
validateGeneratedArtifacts
	super validateGeneratedArtifacts.
	
	self 
		assert: (OSProcess waitForCommand: self type, ' ',self optionDash,'help') succeeded
		description: self type, ' ',self optionDash,'help did not run properly.' 