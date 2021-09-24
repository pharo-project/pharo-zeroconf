accessing scripts
vmScripts
	^ self imageVersions flatCollect: [ :each | self vmScriptsVersion: each ]