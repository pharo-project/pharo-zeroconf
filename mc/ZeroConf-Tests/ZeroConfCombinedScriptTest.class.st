"
I test the default combined VM and Image zeroconf scripts.
"
Class {
	#name : #ZeroConfCombinedScriptTest,
	#superclass : #AbstractZeroConfBashScriptTest,
	#category : 'ZeroConf-Tests'
}

{ #category : #coverage }
ZeroConfCombinedScriptTest >> classToBeTested [
	^ ZeroConfCombinedScript
]

{ #category : #helper }
ZeroConfCombinedScriptTest >> runCombinedScriptTest: methodName [
	self runScriptTest: (ZeroConfCombinedScript perform: methodName)
]

{ #category : #tests }
ZeroConfCombinedScriptTest >> testCombineBasic [
	| image vm combined |
	image := ZeroConfPharoImageScript pharo: '30'.
	vm := ZeroConfVMScript pharo.
	combined := image , vm.
	
	self assert: combined basename equals: (image basename, '+', vm basename).
	self assert: combined scripts asArray equals: {image. vm}.
	self 
		assert: combined artifacts size
		equals: image artifacts size + vm artifacts size
]
