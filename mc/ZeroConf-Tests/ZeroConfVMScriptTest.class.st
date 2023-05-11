"
I test the default VM zeroconf scripts.
"
Class {
	#name : #ZeroConfVMScriptTest,
	#superclass : #AbstractZeroConfBashScriptTest,
	#category : 'ZeroConf-Tests'
}

{ #category : #coverage }
ZeroConfVMScriptTest >> classToBeTested [
	^ ZeroConfVMScript
]

{ #category : #helper }
ZeroConfVMScriptTest >> runVMScriptTest: methodName [
	^ self runScriptTest: (ZeroConfVMScript perform: methodName)
]

{ #category : #testing }
ZeroConfVMScriptTest >> testPharo [
	self runVMScriptTest: #pharo
]
