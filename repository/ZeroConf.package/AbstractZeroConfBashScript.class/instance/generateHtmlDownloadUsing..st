script generation html
generateHtmlDownloadUsing: aCommandString
	self 
		<< '<code>'; << aCommandString; << '<a href="'; print: self url; << '">';
		<< self formattedUrl; << '</a> | bash </code>'; cr