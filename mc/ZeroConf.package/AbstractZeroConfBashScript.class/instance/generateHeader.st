script generation
generateHeader
	self << '#!/usr/bin/env bash'; cr.
	self needsHtmlHelp
		ifTrue: [ self generateHtmlHeader; cr ].
	self 
		generateBashSettings; cr;
		generateHelperMethods.