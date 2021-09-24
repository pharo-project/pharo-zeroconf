accessing
url
	| base |
	
	base := self class basenameVM.
	self isLatest ifTrue: [ base := base, 'Latest' ].
	^ self baseUrl / (base, release capitalized)