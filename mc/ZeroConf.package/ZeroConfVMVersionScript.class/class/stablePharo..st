instance creation
stablePharo: version 
	^ self 
		type: 'pharo' 
		release: version
		status: #stable