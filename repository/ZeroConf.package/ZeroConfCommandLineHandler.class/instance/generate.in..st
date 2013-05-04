actions generating
generate: script in: aDirectory
	aDirectory ensureDirectory.
	
	self stdout nextPutAll: script basename; lf.
	script 
		ensureDeleted;
		directory: aDirectory;
		generate.