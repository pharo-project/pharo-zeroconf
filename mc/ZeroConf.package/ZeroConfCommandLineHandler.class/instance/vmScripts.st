accessing scripts
vmScripts
	^ self imageVersions 
		inject: #() 
		into: [ :all :each | all, (self vmScriptsVersion: each) ]