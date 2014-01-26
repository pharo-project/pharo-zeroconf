script generation
generateDownloadFor: script
	self
		<<-- script description; 
		<< '$DOWNLOAD '; print: script url; << ' | bash '; cr.