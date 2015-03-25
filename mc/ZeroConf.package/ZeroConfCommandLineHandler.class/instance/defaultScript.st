accessing
defaultScript
	^ (ZeroConfImageVersionScript pharo: self class stableVersion), 
	  (ZeroConfVMVersionScript pharo: self class stableVersion status: #stable) 