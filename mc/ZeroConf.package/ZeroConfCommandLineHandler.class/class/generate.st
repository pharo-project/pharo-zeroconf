helper
generate
	self new
		commandLine: (CommandLineArguments withArguments: #('--output=out'));
		generateScripts