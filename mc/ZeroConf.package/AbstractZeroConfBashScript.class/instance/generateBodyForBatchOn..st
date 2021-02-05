script generation
generateBodyForBatchOn: aStream
	self outputStream: aStream.
	^ self generateBodyForBatch.