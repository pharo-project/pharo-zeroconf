accessing
symbolicImageScripts
	"manually mark a stable and an unstable alpha release"
	^ { 
		ZeroConfPharoImageScript pharo40
			basename: 'stable';
			yourself.
		ZeroConfPharoImageScript pharo50
			basename: 'alpha';
			yourself. }