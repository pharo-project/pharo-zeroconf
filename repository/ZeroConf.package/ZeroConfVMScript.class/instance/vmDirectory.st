accessing
vmDirectory
	^ vmDirectory ifNil: [ 'vm' asFileReference ]