helper testing
helpTest
	"Test if the generate ZeroConf script successfully runs with --help"

	OSPlatform current isWindows
		ifTrue: [ ^ self ].
	OSSUnixSubprocess new
		command: 'bash';
		arguments:
			{script file fullName.
			'--help'};
		redirectStdout;
		runAndWaitOnExitDo: [ :process :outString | self assert: process isSuccess ]