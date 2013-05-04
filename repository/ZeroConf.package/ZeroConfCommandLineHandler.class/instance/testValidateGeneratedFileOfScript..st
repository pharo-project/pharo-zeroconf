actions testing
testValidateGeneratedFileOfScript: aScript
	aScript file isFile
		ifFalse: [ 
			self exitFailure: aScript file fullName, ' was not exported' ].
	aScript file readStream contents size > 0
		ifFalse: [ 
			self exitFailure: aScript file fullName, ' was not exported' ].