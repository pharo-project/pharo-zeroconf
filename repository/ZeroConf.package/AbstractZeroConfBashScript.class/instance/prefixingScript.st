accessing
prefixingScript
	^ prefixingScript ifNil: [ self defaultPrefixingScript ]