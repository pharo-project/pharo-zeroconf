helper
runVMScriptTest: methodName
	^ self runScriptTest: (ZeroConfVMScript perform: methodName)