actions testing
redirectOutputOfProcess: process
	^ [ 
	[ 
	process pipeFromError
		ifNotNil: [ :pipe | 
			[ 
			self stderr
				nextPutAll: (pipe next: 16);
				flush ]
				on: Error
				do: [ :err | 
					"nothing"
					 ] ] ] repeat ] fork