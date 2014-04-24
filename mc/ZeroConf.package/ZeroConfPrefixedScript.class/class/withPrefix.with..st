instance creation
withPrefix: aScript with: anotherScript
	^ self new
		addPrefix: aScript;
		addPrefix: anotherScript;
		yourself