tests
testCombineBasic
	| image vm combined |
	image := ZeroConfPharoImageScript pharo: '30'.
	vm := ZeroConfVMScript pharo.
	combined := image , vm.
	
	self assert: combined basename equals: (image basename, '+', vm basename).
	self assert: combined scripts asArray equals: {image. vm}.
	self 
		assert: combined artifacts size
		equals: image artifacts size + vm artifacts size