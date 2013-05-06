validation
validate
	"validate the generated script"
	self
		validateGenerate;
		validateScript.
	self
		validateRun; 
		validateGeneratedArtifacts.