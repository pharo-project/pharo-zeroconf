actions testing
waitForScript: aScript
	| OSProcess process redirect |
	
	OSProcess := Smalltalk globals at: #PipeableOSProcess.
	process := OSProcess 
		command: 'bash ', aScript basename
		environment: nil
		workingDir: self testDirectory fullName
		input: nil
		output: nil
		error: nil
		errorPipelineStream: nil.
	
	self printRunMessageForScript: aScript.
	
	redirect := self redirectOutputOfProcess: process.	"nothing"
	[ self waitForScript: aScript inProcess: process ]
		ensure: [ redirect terminate ]