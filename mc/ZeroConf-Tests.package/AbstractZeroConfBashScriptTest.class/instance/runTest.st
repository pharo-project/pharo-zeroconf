helper testing
runTest
	"Test if the generate ZeroConf script successfully runs and creates the artifacts"
	self flag: #todo.
	OSPlatform current isWindows
		ifTrue: [ ^ self skip ].
	script validateRun.
	script artifacts
		do: [ :artifact | self assert: (script directory / artifact) exists ]