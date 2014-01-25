helper
runCombinedScriptTest: methodName
	self runScriptTest: (ZeroConfCombinedScript perform: methodName)