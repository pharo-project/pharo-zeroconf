running
run
	| process redirect |
	
	process := PipeableOSProcess 
		command: 'bash ', self basename
		environment: nil
		workingDir: self directory fullName
		input: nil
		output: nil
		error: nil
		errorPipelineStream: nil.
	
	redirect := self redirectOutputOfProcess: process.	"nothing"
	[ self waitForRunProcess: process ]
		ensure: [ redirect terminate ]