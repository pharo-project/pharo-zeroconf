helper testing
helpTest
	"Test if the generate ZeroConf script successfully runs with --help"
	| result |
	result := OSProcess waitForCommand: 'bash ', script file fullName, ' --help'.
	self assert: result succeeded.