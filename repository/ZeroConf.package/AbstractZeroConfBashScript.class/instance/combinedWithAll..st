combining
combinedWithAll: combinedScripts
	^ (ZeroConfCombinedScript with: self)
		addAll: combinedScripts scripts;
		yourself