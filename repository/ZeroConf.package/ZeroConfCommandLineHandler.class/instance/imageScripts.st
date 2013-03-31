accessing
imageScripts
	^ self imageVersions collect: [ :version|
		ZeroConfImageScript pharo: version ]