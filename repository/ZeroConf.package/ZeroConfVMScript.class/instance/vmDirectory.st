accessing
vmDirectory
	^ vmDirectory ifNil: [ 'pharo-vm' asFileReference ]