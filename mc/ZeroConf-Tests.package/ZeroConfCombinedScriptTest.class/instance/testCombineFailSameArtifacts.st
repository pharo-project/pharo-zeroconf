tests
testCombineFailSameArtifacts
	| image |
	image := ZeroConfPharoImageScript pharo30.
	
	self should: [ (image, image) artifactDescription ] raise: Error.