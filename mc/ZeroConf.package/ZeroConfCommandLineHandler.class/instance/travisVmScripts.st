accessing
travisVmScripts
	^ self vmScripts collect: [ :script| ZeroConfTravisVM new, script ]