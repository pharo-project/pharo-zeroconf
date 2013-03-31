script generation
generate
	self openOutputStream.
	self 
		generateHeader; cr; cr;
		generateHelp; cr; cr;
		generateBody; cr; cr.
	self needsHtmlHelp 
		ifTrue: [ self generateHtmlHelp ]