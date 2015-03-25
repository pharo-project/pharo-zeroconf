accessing
minimalScripts
	^ (self imageVersions 
		select: [ :each | ZeroConfMinimalImageVersionScript canBeGenerated: each ]) 
		collect: [ :each | ZeroConfMinimalImageVersionScript pharo: each ]