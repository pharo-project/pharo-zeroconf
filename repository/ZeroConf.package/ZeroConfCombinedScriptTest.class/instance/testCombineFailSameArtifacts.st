tests
testCombineFailSameArtifacts
	| image |
	image := ZeroConfImageScript pharo30.
	
	self should: [ (image, image) artifactDescription ] raise: Error.