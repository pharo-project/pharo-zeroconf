actions
generateScripts
	self scripts do: [ :script |
		self generate: script ]