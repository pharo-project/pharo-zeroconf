script generation html
generateHtmlHelpBody
	self 
		<< '<h1>'; << self htmlTitle; << '</h1>'; cr;
		<< '<p>'; << self htmlDescription; << '</p>'; cr;		
		<< '<h2>Usage</h2>'; cr;
		generateHtmlDownloadUsing: 'curl '; << '<br/>'; cr;
		<< 'or if <code>curl</code> is not available: </br>'; cr;
		generateHtmlDownloadUsing: 'wget -O- ';<< '<br/>'; cr;
		<< 'And for windows: <br/>'; cr;
		generateHtmlDownloadForBatchUsing: 'curl'; << '<br/>'; cr;
		
		<< '<h2>Artifacts</h2>'; cr;
		generateHtmlArtifactDescription; cr;
		<< self additionalHtmlHelp