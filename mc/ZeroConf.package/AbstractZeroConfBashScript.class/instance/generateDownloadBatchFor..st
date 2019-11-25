script generation
generateDownloadBatchFor: script
	self
		<< 'REM ' << script description;  cr;
		<< ' call %DOWNLOAD% '; print: script url; << ' | cmd '; cr.