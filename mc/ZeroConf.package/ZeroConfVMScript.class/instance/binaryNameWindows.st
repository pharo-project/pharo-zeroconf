accessing
binaryNameWindows
	"Starting with 60, PharoVM has also PharoConsole.exe, to allow write to console"
	| binaryNameSuffix |
	binaryNameSuffix := (self release = #stable or: [self release asNumber >= 60])
		ifTrue: [ 'Console' ]
		ifFalse: [ '' ].

	^ self binaryName , binaryNameSuffix