actions testing
validateOutputOfScript: aScript
	| generatedArtifacts expectedArtifacts |
	
	self waitForScript: aScript.
	
	expectedArtifacts := ({ aScript basename }, aScript artifacts) sorted.
	expectedArtifacts := expectedArtifacts collect: [ :artifactName | artifactName asFileReference basename ].
	generatedArtifacts := self testDirectory childNames sort.
	
	generatedArtifacts
		ifEmpty: [ ^ self exitFailure: aScript file fullName, ' did not generate any content' ].
	
	generatedArtifacts = expectedArtifacts
		ifFalse: [  ^ self exitFailure: aScript file fullName, ' did not generate ', (expectedArtifacts \ generatedArtifacts) asString ].
	
	
	