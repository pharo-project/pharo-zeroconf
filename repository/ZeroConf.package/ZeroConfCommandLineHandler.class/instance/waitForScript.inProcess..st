actions testing
waitForScript: aScript inProcess: process
	
	[[ 10 milliSeconds wait. process isComplete ] whileFalse ]
		valueWithin: self testTimeout
		onTimeout: [ 
			self exitFailure: 'Timout: ' , aScript file fullName , ' took longer than ' , self testTimeout asString , ' to finish' ].
		
	process succeeded
		ifFalse: [  ^ self exitFailure:  aScript file fullName , ' did not succeed' ]