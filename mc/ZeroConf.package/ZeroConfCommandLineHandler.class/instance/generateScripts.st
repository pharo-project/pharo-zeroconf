actions generating
generateScripts
	self scripts do: [ :script | self generate: script ].
	self generate: self indexScript.
	
	outputDirectory := self outputDirectory / self class subdir64. 
	self scripts64 do: [ :script | self generate: script ].
	self generate: self index64Script.
