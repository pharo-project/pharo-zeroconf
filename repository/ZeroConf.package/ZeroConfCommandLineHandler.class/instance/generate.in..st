actions generating
generate: script in: aDirectory
	aDirectory ensureDirectory.
	
	self stdout nextPutAll: script basename; lf.
	script 
		ensureDelete;
		directory: aDirectory;
		generate.