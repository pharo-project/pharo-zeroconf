script generation html
generateHtmlHelpBody
	self 
		<< '<h1>'; << self htmlTitle; << '</h1>'; cr;
		<< '<p>'; << self htmlDescription; << '</p>'; cr;
		
		<< '<h2>Usage</h2>'; cr;
		<< '<code>wget -O - <a href="'; print: self url; << '">'; 
			"hack to make the $+ appear in the url string"
			<< self url asString urlDecoded; 
		<< '</a> | bash </code>'; cr;
		
		<< '<h2>Artifacts</h2>'; cr;
		generateHtmlArtifactDescription; cr.