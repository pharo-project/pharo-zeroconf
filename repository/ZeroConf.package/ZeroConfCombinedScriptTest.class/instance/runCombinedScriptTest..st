helper
runCombinedScriptTest: methodName
	self runScriptTest: (ZeroConfCombinedScriptTest perform: methodName)