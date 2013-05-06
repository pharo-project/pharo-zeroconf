actions testing
validateOutputOfScript: aScript
	| generatedArtifacts expectedArtifacts |
	
	self waitForScript: aScript.
	
	
	"cannot test combined scripts as they download the other scripts from the server	which most probably are still using the old data. Hence they might produce outdated	artifacts."
	aScript isCombined
		ifTrue: [ ^ self ].
					
	expectedArtifacts := ({ aScript basename }, aScript artifacts) sorted.
	expectedArtifacts := expectedArtifacts collect: [ :artifactName | artifactName asFileReference basename ].
	generatedArtifacts := self testDirectory childNames sort.
	
	generatedArtifacts
		ifEmpty: [ ^ self exitFailure: aScript file fullName, ' did not generate any content' ].
	
	generatedArtifacts = expectedArtifacts
		ifFalse: [  ^ self exitFailure: (String streamContents: [ :stream | 
			stream << aScript file fullName;
				<< 'did not generate the approriate files:'; lf;
				<< '    missing:   '; print: (expectedArtifacts \ generatedArtifacts);
				<< '    additiona: '; print: (generatedArtifacts \ expectedArtifacts)])].
	
	
	