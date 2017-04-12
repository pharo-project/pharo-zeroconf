accessing scripts
numericImageScripts
	^ self imageVersions collect: [ :version|
		ZeroConfImageVersionScript pharo: version ]