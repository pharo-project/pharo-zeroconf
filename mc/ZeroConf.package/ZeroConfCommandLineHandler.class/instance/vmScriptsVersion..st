accessing scripts
vmScriptsVersion: version
	| scripts |
	
	scripts := { 
		ZeroConfVMVersionScript stablePharo: version }.

	"Just alpha versions have unstable vms (once released, vm freezes)"
	version = self class alphaVersion ifTrue: [ 
		scripts := scripts copyWith: (ZeroConfVMVersionScript latestPharo: version) ].

	^ scripts