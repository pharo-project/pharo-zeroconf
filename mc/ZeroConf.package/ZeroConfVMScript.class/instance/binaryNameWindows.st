accessing
binaryNameWindows
	"Starting with 60, PharoVM has also PharoConsole.exe, to allow write to console"
	^ self binaryName, (self release asNumber >= 60 
		ifTrue: [ 'Console' ]
		ifFalse: [ '' ])