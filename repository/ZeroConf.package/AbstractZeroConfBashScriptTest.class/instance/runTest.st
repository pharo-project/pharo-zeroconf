helper testing
runTest
	"Test if the generate ZeroConf script successfully runs and creates the artifacts"
	self flag: #todo.
	script artifacts do: [ :artifact|
		self assert: artifact asFileReference exists ]