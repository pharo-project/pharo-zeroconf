file creation
openOutputStream
	self directory ensureCreateDirectory.
	
	outputStream := ZnNewLineWriterStream on: self file writeStream.
	outputStream forLf.
	