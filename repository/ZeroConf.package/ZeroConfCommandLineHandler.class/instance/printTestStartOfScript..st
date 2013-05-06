actions testing
printTestStartOfScript: aScript
	| message |
	message := aScript file fullName.
	self stderr
		nextPutAll: message; lf;
		nextPutAll: ('' padLeftTo: message size with: $=).