accessing
url
	| base |
	
	base := self class basenameVM.
	self isStack ifTrue: [ base := base, 'S' ].
	self isLatest ifTrue: [ base := base, 'Latest' ].
	^ self baseUrl / (base, release capitalized)