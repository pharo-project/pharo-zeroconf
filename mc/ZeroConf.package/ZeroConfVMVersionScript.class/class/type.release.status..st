instance creation
type: aVMTypeString release: version status: status
	^ self new
		type: aVMTypeString;
		release: version asString;
		status: status;
		yourself