accessing scripts
symbolicImageScripts
	"manually mark a stable and an unstable alpha release"
	^ { 
		(ZeroConfImageVersionScript pharo: self class stableVersion)
			basename: 'stable';
			yourself.
		(ZeroConfImageVersionScript pharo: self class alphaVersion)
			basename: 'alpha';
			yourself. }