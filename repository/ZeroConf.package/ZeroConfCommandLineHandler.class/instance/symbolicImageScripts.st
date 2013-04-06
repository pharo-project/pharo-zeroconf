accessing
symbolicImageScripts
	^ self imageVersions collect: [ :version|
		ZeroConfPharoImageScript pharo: version ]