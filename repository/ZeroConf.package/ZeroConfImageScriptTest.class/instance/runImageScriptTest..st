helper
runImageScriptTest: methodName
	self runScriptTest: (self classToBeTested perform: methodName)