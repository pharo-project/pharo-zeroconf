actions testing
testRunScript: aScript
	| message timeout |
	self halt.
	
	message := 'Start running ', aScript file fullName.
	timeout := 30 seconds.
	
	self stderr 
		yellow: message; lf;
		yellow: ('' padRightTo: message size with: $= ); lf.
		
	[ self testValidateOutputOfScript: aScript ] 
		valueWithin: 30 seconds 
		onTimeout: [ 
			self exitFailure: 'Timout: ', aScript file fullName, ' took longer than ', timeout asSeconds, ' to finish' ]