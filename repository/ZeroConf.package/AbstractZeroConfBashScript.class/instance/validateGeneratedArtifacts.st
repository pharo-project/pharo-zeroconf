validation
validateGeneratedArtifacts
	| generatedArtifacts expectedArtifacts |
					
	expectedArtifacts := ({ self basename }, self artifacts) sorted.
	expectedArtifacts := expectedArtifacts collect: [ :artifactName | artifactName asFileReference basename ].
	generatedArtifacts := self directory childNames sort.
	
	generatedArtifacts
		ifEmpty: [ ^ self exitFailure: self file fullName, ' did not generate any content' ].
	
	generatedArtifacts = expectedArtifacts
		ifFalse: [  ^ self exitFailure: (String streamContents: [ :stream | 
			stream << self file fullName;
				<< 'did not generate the approriate files:'; lf;
				<< '    missing:   '; print: (expectedArtifacts \ generatedArtifacts);
				<< '    additional: '; print: (generatedArtifacts \ expectedArtifacts) ])].