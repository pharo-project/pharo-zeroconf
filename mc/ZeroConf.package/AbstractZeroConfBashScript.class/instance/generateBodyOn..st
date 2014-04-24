script generation
generateBodyOn: aStream
	self outputStream: aStream.
	^ self generateBody.