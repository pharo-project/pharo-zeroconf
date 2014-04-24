script generation
generateHelpMessage
	self
		<< self description; cr; 
		<< 'The following artifacts are created:'; cr;
		generateArtifactsDescription; cr;
		<< self additionalHelp