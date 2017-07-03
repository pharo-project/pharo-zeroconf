accessing scripts
vmScriptsVersion: version
	| scripts hasThreaded hasTimer |
	
	scripts := { 
		ZeroConfVMVersionScript stablePharo: version.
		"ZeroConfVMVersionScript stablePharoS: version" }.
		
	hasThreaded := ZeroConfVMVersionThreadedHearbeatScript worksWithVersion: version.
	hasThreaded ifTrue: [ 
		scripts := scripts copyWith: (ZeroConfVMVersionThreadedHearbeatScript stablePharo: version) ]. 

	hasTimer := ZeroConfVMVersionTimerHearbeatScript worksWithVersion: version.
	hasTimer ifTrue: [ 
		scripts := scripts copyWith: (ZeroConfVMVersionTimerHearbeatScript stablePharo: version) ]. 

	"Just alpha versions have unstable vms (once released, vm freezes)"
	version = self class alphaVersion ifTrue: [ 
		scripts := scripts copyWith: (ZeroConfVMVersionScript latestPharo: version).
		hasThreaded ifTrue: [ 
			scripts := scripts copyWith: (ZeroConfVMVersionThreadedHearbeatScript latestPharo: version) ].
		hasTimer ifTrue: [ 
			scripts := scripts copyWith: (ZeroConfVMVersionTimerHearbeatScript latestPharo: version) ] ].

	^ scripts