script generation html
generateHtmlHelpBody
	self 
		<< '<h1>'; << self htmlTitle; << '</h1>'; cr;
		<< '<p>'; << self htmlDescription; << '</p>'; cr;		
		<< '<h2>Usage</h2>'; cr;
		generateHtmlDownloadUsing: 'wget -O- '; << '<br/>'; cr;
		<< 'or if <code>wget</code> is not available: </br>'; cr;
		generateHtmlDownloadUsing: 'curl -L '; cr;
		
		<< '<h2>Artifacts</h2>'; cr;
		generateHtmlArtifactDescription; cr;
		<< self additionalHtmlHelp