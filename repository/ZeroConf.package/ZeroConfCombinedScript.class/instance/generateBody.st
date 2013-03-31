script generation
generateBody
	self <<== 'DOWNLOAD SUB-SCRIPTS'.
	self scripts do: [ :script |
		self generateDownloadFor: script ]