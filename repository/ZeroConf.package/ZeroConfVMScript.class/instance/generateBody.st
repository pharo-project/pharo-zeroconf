script generation
generateBody
	self
		generateDetectSystemProperties; cr; cr;
		generateDownloadVM; cr; cr;
		generateDownloadSources; cr; cr;
		generateVMScriptCreator; cr; cr;
		generateLinuxScriptTest