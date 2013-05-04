actions testing
waitForScript: aScript
	| OSProcess process relayOutput |
	OSProcess := Smalltalk globals at: #PipeableOSProcess.
	process := OSProcess 
		command: 'bash ', aScript basename.
	
	relayOutput := [[ 
		process pipeFromError ifNotNil: [ :pipe | 
			[ self stderr nextPutAll: (pipe next: 16); flush ] 
				on:Error do: [ :err | "nothing" ]]
		] repeat ] fork.
	
	[ 10 milliSeconds wait.  
	process isComplete ] whileFalse.

	relayOutput terminate.