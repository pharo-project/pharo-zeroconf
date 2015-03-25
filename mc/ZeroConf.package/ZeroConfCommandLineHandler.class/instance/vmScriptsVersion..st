accessing
vmScriptsVersion: version
	| scripts |
	
	scripts := { 
		ZeroConfVMVersionScript pharo: version status: #stable.
		ZeroConfVMVersionScript pharoS: version status: #stable }.

	"Just alpha versions have unstable vms (once released, vm freezes)"
	version = self class alphaVersion ifTrue: [ 
		scripts := scripts copyWith: (ZeroConfVMVersionScript pharo: version status: #latest) ].

	^ scripts