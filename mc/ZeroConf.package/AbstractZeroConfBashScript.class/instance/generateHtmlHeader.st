script generation html
generateHtmlHeader
	self 
		<< '#<html><head><!--'; cr;
		<< '# The line above makes a fake HTML document out of this bash script'; cr; cr;
		<< '#This zero conf script was generated from the sources found in:'; cr; tab;
		<< 'https://github.com/pharo-project/pharo-zeroconf'; cr.