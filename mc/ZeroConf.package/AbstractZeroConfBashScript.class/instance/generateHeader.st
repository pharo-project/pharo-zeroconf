script generation
generateHeader
	self << '#!/bin/bash'; cr.
	self needsHtmlHelp
		ifTrue: [ self generateHtmlHeader; cr ].
	self 
		generateBashSettings; cr;
		generateHelperMethods.