accessing scripts
vmScriptsVersion: version
	| scripts hasThreaded |
	
	scripts := { 
		ZeroConfVMVersionScript stablePharo: version.
		"ZeroConfVMVersionScript stablePharoS: version" }.
		
	hasThreaded := ZeroConfVMVersionThreadedScript worksWithVersion: version.
	hasThreaded ifTrue: [ 
		scripts := scripts copyWith: (ZeroConfVMVersionThreadedScript stablePharo: version) ]. 

	"Just alpha versions have unstable vms (once released, vm freezes)"
	version = self class alphaVersion ifTrue: [ 
		scripts := scripts copyWith: (ZeroConfVMVersionScript latestPharo: version).
		hasThreaded ifTrue: [ 
			scripts := scripts copyWith: (ZeroConfVMVersionThreadedScript latestPharo: version) ] ].

	^ scripts