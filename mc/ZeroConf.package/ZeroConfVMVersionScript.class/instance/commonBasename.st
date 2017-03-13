accessing
commonBasename
	"Calculates a 'generic' basename, which means a basename without version number"
	| base |
	
	base := self class basenameVM.
	self isStack ifTrue: [ base := base, 'S' ].
	self isLatest ifTrue: [ base := base, 'Latest' ].

	^ base