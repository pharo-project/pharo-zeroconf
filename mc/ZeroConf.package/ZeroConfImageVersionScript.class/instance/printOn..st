printing
printOn: aStream

	super printOn: aStream.
	aStream
		nextPutAll: '(';
		nextPutAll: self imageFileName;
		nextPutAll: version asString;
		nextPutAll: release asString;
		nextPutAll: ')'