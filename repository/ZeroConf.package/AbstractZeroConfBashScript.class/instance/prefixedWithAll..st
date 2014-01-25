combining
prefixedWithAll: prefixedScript
	^ (self prefixingScript with: self)
		addAllPrefix: prefixedScript prefixScripts;
		yourself