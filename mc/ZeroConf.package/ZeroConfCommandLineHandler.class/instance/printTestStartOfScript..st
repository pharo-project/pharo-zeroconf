actions testing
printTestStartOfScript: aScript
	| message |
	message := 'Testing ', aScript file fullName.
	self stderr
		yellow: message; lf;
		yellow: ('' padLeftTo: message size with: $=); lf.