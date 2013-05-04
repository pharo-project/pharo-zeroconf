actions generating
generateScripts
	
	self scripts do: [ :script |
		self generate: script ].
	
	self generate: self indexScript.