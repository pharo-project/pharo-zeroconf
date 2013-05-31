script generation
generateBody
	self
		generateVmProperties; cr; cr;
		generateDetectSystemProperties; cr; cr;
		generateDownloadVm; cr; cr;
		generateDownloadSources; cr; cr;
		generateVmScriptCreator; cr; cr;
		generateLinuxScriptTest