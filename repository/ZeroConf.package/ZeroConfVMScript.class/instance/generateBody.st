script generation
generateBody
	self
		generateVmProperties; cr; cr;
		generateDetectSystemProperties; cr; cr;
		generateDownloadVM; cr; cr;
		generateDownloadSources; cr; cr;
		generateVMScriptCreator; cr; cr;
		generateLinuxScriptTest