accessing
outputDir
	^ outputDir ifNil: [ 
		outputDir := (self hasOption: 'output')
			ifTrue: [ (self optionAt: 'output') asFileReference ]
			ifFalse: [ FileSystem workingDirectory ]]