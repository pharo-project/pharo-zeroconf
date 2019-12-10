accessing scripts
vmScriptsVersion: version
	| scripts hasThreaded hasTimer hasHeadless |
	
	scripts := { 
		ZeroConfVMVersionScript stablePharo: version.
		"ZeroConfVMVersionScript stablePharoS: version" }.
		
	hasThreaded := ZeroConfVMVersionThreadedHearbeatScript worksWithVersion: version.
	hasThreaded ifTrue: [ 
		scripts := scripts copyWith: (ZeroConfVMVersionThreadedHearbeatScript stablePharo: version) ]. 

	hasTimer := ZeroConfVMVersionTimerHearbeatScript worksWithVersion: version.
	hasTimer ifTrue: [ 
		scripts := scripts copyWith: (ZeroConfVMVersionTimerHearbeatScript stablePharo: version) ]. 
	
	hasHeadless := ZeroConfVMVersionHeadlessScript worksWithVersion: version.
	hasHeadless ifTrue: [ 
		scripts := scripts copyWith: (ZeroConfVMVersionHeadlessScript stablePharo: version) ]. 

	"Just alpha versions have unstable vms (once released, vm freezes)"
	version = self class alphaVersion ifTrue: [ 
		scripts := scripts copyWith: (ZeroConfVMVersionScript latestPharo: version).
		
		hasThreaded ifTrue: [ 
			scripts := scripts copyWith: (ZeroConfVMVersionThreadedHearbeatScript latestPharo: version) ].
		hasTimer ifTrue: [ 
			scripts := scripts copyWith: (ZeroConfVMVersionTimerHearbeatScript latestPharo: version) ].
		
		hasHeadless ifTrue: [ 
			scripts := scripts copyWith: (ZeroConfVMVersionHeadlessScript latestPharo: version) ] ].

	^ scripts