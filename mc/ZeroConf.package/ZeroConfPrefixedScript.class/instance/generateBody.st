script generation
generateBody
	self inlinePrefixScripts 
		ifTrue: [ self generatePrefixScripts ].
	super generateBody