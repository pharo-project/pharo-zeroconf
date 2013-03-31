accessing
artifactDescription
	^ Dictionary new
		at: self vmFolderName,'/' 	put: 'Directory containing the VM';
		at: self type         		put: 'Script to run the downloaded VM in headless mode';
		at: self type, '-ui'  		put: 'Script to run the downloaded VM in UI mode';
		yourself