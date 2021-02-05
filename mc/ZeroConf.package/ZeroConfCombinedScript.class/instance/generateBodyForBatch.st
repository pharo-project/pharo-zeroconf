script generation
generateBodyForBatch
	self << 'Rem DOWNLOAD SUB-SCRIPTS' ;cr.
	self generateScripts
		do: [ :script | self generateDownloadBatchFor: script ]