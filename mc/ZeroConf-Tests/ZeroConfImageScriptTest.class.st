"
I test the default Image zeroconf scripts.
"
Class {
	#name : #ZeroConfImageScriptTest,
	#superclass : #AbstractZeroConfBashScriptTest,
	#category : 'ZeroConf-Tests'
}

{ #category : #coverage }
ZeroConfImageScriptTest >> classToBeTested [
	^ ZeroConfImageScript
]

{ #category : #helper }
ZeroConfImageScriptTest >> runImageScriptTest: methodName [
	self runScriptTest: (self classToBeTested perform: methodName)
]
