*ZeroConf-Tests-running
waitForRunProcess: process
	[ 10 milliSeconds wait. process isComplete ] whileFalse.

	self 
		assert: process succeeded
		description: self file fullName , ' did not succeed'