*ZeroConf-Tests-running
run
	OSSUnixSubprocess new
		command: 'bash';
		workingDirectory: self directory fullName;
		arguments: { self basename };
		redirectStdout;
		runAndWaitOnExitDo: [ :process :outString  |
			self 
				assert: process isSuccess
				description: self file fullName , ' did not succeed'
		].
