script generation
generateDownloadFor: script
	self << '$DOWNLOAD '; print: script url; << ' | bash '; cr.