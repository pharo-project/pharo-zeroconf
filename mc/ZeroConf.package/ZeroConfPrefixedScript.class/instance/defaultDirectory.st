accessing
defaultDirectory
	| fileReference |
	fileReference := FileLocator workingDirectory.
	self prefixScripts do: [ :script |
		fileReference := fileReference / script basename ].
	^ fileReference