actions
generate: script
	self stdout nextPutAll: script basename; lf.
	script 
		ensureDeleted;
		directory: self outputDir;
		generate.