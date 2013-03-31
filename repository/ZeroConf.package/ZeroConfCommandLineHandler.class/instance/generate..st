actions
generate: script
	self stdout nextPutAll: script basename; lf.
	script generate.