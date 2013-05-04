actions testing
printRunMessageForScript: aScript
	| message |
	message := 'Start running ' , aScript file fullName.
	self stderr
		yellow: message;
		lf;
		yellow: ('' padRightTo: message size with: $=);
		lf