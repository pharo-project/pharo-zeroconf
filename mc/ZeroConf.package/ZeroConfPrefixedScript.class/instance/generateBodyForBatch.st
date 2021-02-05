script generation
generateBodyForBatch
	self inlinePrefixScripts 
		ifTrue: [ self generatePrefixScriptsForBatch ].
	super generateBodyForBatch