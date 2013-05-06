actions testing
ensureEmptyTestDirectory
	self testDirectory exists
		ifFalse: [ ^ self testDirectory ensureDirectory ].
		
	self testDirectory isFile
		ifTrue: [ ^ self exitFailure: 'Test output directory ', self testDirectory fullName, ' is an exising file.' ].
		
	self testDirectory hasChildren
		ifTrue: [ ^ self exitFailure: 'Test output directory ', self testDirectory fullName, ' is not empty.' ].