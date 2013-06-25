script generation html
generateHtmlHelp
	self 
		<<== 'HTML HELP';
		<< 'HTML_HELP=<<HTML_HELP '; cr; << '-->'; cr;
		<< '<title>'; << self htmlTitle; << '</title>'; cr;
		<< '<style>'; generateHtmlStyle; << '</style>'; cr;
		<< '<body>'; cr;
		generateHtmlHelpBody; cr;
		<< '<!--'; cr;
		<< 'HTML_HELP';cr;
		<< '# --!></body></html>'