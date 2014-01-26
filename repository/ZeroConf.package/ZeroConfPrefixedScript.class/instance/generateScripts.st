as yet unclassified
generateScripts

	self inlinePrefixScripts 
		ifTrue: [ ^ self scripts ].
		
	^ self prefixScripts, self scripts