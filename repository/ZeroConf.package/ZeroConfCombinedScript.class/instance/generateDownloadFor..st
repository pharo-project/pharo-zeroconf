script generation
generateDownloadFor: script
	self << 'wget --quiet -O - '; print: script url; << ' | bash '; cr.