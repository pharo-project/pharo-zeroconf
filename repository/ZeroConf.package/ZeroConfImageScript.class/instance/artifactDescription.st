accessing
artifactDescription
	^ Dictionary new
		at: 'Pharo.image' put: 'A Pharo image, to be opened with the Pharo VM';
		at: 'Pharo.changes' put: 'A changes file for the Pharo Image';
		yourself