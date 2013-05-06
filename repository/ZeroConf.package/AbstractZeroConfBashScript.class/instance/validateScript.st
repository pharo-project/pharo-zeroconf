validation
validateScript
	self 
		assert: self file isFile
		description: self file fullName, ' was not exported'.
		
	self 
		assert: self file readStream contents size > 0
		description: self file fullName, ' was not exported'.
		
	