accessing
basename
	^ ((self release = 'stable') or: [ self release = 'latest' ])
		ifTrue: [ self commonBasename ]
		ifFalse: [ self commonBasename, release ]
	
