validation
validateRun
	[ self run ]	
		valueWithin: self validationTimeout 
		onTimeout: [ 
			AssertionFailure signal: (String streamContents: [ :stream|
				stream 
					<< 'Timeout: '; print: self  file; 
					<< ' took longer than '; print: self validationTimeout; << ' to finish' ])]