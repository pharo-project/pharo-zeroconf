file creation
openOutputStream
	outputStream ifNotNil: [ 
		outputStream open ifTrue: [ ^ self ]].
	
	outputStream := self file writeStream.
	outputStream
		wantsLineEndConversion: true;
		lineEndConvention: #lf.
	