accessing
artifactDescription
	^ Dictionary new
		at: self imageName, '.image' put: 'A ', self imageName, ' image, to be opened with the Pharo VM';
		at: self imageName, '.changes' put: 'A changes file for the ', self imageName, ' Image';
		yourself