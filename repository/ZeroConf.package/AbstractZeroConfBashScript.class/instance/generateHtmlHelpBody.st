script generation
generateHtmlHelpBody
	self 
		<< '<h1>'; << self htmlTitle; << '</h1>'; cr;
		<< '<p>'; << self description; << '</p>'; cr;
		
		<< '<h2>Usage</h2>'; cr;
		<< '<code>wget -O - '; print: self url; << ' | bash </code>'; cr;
		
		<< '<h2>Artifacts</h2>'; cr;
		generateHtmlArtifactDescription; cr.