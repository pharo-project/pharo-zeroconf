script generation
generateBody
	self <<== 'DOWNLOAD SUB-SCRIPTS'.
	self generateScripts do: [ :script |
		self generateDownloadFor: script ]