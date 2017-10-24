helper
generateInDirectory: aReference
	self new
		commandLine: (CommandLineArguments withArguments: {'--output=', aReference fullName});
		generateScripts