script generation
generateDownloadBatchFor: script
	self
		<< 'REM ' << script description;  cr;
		<< 'call %DOWNLOAD_TO% '; << script basenameForFileName ;<< '.bat '; print: script url; << ' & cmd /c '; << script basenameForFileName ;<< '.bat & del '; << script basenameForFileName ;<< '.bat' ; cr.