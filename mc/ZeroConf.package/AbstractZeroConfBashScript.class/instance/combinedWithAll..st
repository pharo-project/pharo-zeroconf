combining
combinedWithAll: combinedScripts
	^ (self combiningScript with: self)
		addAll: combinedScripts scripts;
		yourself