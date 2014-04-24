actions generating
generate: script 
	self setScriptDirectory: script.
	script directory ensureCreateDirectory.
	
	self stdout nextPutAll: script basename; lf.
	script 
		ensureDelete;
		generate.