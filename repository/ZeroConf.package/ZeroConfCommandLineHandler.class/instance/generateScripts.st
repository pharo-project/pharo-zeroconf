actions
generateScripts
	self outputDir ensureDirectory.
	
	self scripts do: [ :script |
		self generate: script ].
	
	self generateIndexScript.