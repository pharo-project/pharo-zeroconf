accessing
symbolicImageScripts
	"manually mark a stable and an unstable alpha release"
	^ { 
		ZeroConfPharoImageScript pharo20
			basename: 'stable';
			yourself.
		ZeroConfPharoImageScript pharo30
			basename: 'alpha';
			yourself. }