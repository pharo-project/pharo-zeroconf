helper testing
generateTest
	"Test if the given ZeroConfBashScript generates a proper bash script"
	script generate.
	self assert: script file exists.
	self assert: script file readStream contents size > 0