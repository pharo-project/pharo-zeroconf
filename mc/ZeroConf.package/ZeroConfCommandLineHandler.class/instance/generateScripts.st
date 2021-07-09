actions generating
generateScripts
	self scripts do: [ :script | self generate: script ].
	1halt.
	self generate: self indexScript