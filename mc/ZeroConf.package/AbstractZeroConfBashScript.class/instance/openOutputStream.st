file creation
openOutputStream
	outputStream ifNotNil: [ 
		outputStream open ifTrue: [ ^ self ]].
	
	self directory ensureCreateDirectory.
	
	outputStream := self file writeStream.
	outputStream
		wantsLineEndConversion: true;
		lineEndConvention: #lf.
	