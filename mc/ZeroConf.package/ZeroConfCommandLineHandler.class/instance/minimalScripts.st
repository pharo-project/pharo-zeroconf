accessing
minimalScripts
	^ (self imageVersions 
		select: [ :each | ZeroConfMinimalImageScript canBeGenerated: each ]) 
		collect: [ :each | ZeroConfMinimalImageScript minimal: each ]