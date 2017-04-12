accessing scripts 64
vm64Scripts
	^ self image64Versions 
		inject: #() 
		into: [ :all :each | all, ((self vmScriptsVersion: each) do: #be64bits) ]