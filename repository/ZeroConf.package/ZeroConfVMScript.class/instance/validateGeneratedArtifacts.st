validation
validateGeneratedArtifacts
	super validateGeneratedArtifacts.
	"check if the VM runs properly"
	"skipped until we have to new VMs"
	"
	self 
		assert: (OSProcess waitForCommand: self type, ' -help') succeeded
		description: self type, ' --help did not run properly.' "