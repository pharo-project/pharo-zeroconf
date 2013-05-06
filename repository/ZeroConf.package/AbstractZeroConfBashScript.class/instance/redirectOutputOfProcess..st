running
redirectOutputOfProcess: process
	"Creates a simple process that reads stderr from another process and forwards it to stderr of the running image"
	
	^ [ | stderr |
		stderr := FileStream stderr.
		[ process pipeFromError ifNotNil: [ :pipe | 
			[stderr
				nextPutAll: (pipe next: 16);
				flush ]
			on: Error do: [ :err | 
				"nothing"
			]
		]] repeat ] fork