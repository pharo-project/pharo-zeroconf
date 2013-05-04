accessing
outputDirectory
	^ outputDirectory ifNil: [ 
		outputDirectory := (self hasOption: 'output')
			ifTrue: [ (self optionAt: 'output') asFileReference ]
			ifFalse: [ FileSystem workingDirectory ]]