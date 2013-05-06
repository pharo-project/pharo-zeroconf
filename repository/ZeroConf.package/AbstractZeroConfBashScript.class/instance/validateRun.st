validation
validateRun
	[ self run ]	
		valueWithin: self validationTimeout 
		onTimeout: [ 
			AssertionFailure signal: (String streamContents: [ :stream|
				stream 
					<< 'Timout: '; print: self  file; 
					<< ' took longer than '; print: self validationTimeout; << ' to finish' ])]