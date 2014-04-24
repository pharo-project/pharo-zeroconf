script generation
generateArtifactsDescription
	| artifactDescription artifacts maxArtifactNameSize |
	artifactDescription := self artifactDescription.
	artifacts := artifactDescription keys sorted.
	
	maxArtifactNameSize := artifacts inject: 0 into: [ :max :each | each size max: max ].
	
	artifacts 
		do: [ :artifact | 
			self
				<< '    '; << artifact.
			"pad the output"
			(maxArtifactNameSize - artifact size + 2) timesRepeat: [ self << ' '].
			self << (artifactDescription at: artifact)]
		separatedBy: [ self cr ]