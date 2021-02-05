script generation html
generateHtmlDownloadForBatchUsing: aCommandString
	self 
		<< '<code>call '; << aCommandString; << ' --output '; << self basenameForFileName ;<< '.bat <a href="'; print: self url; << '">';
		<< self formattedUrl; << '</a> & cmd /c '; << self basenameForFileName ;<< '.bat & del '; << self basenameForFileName ;<< '.bat</code>'; cr 