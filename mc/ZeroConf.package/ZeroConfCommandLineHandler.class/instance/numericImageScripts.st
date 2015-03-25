accessing
numericImageScripts
	^ self imageVersions collect: [ :version|
		ZeroConfImageVersionScript pharo: version ]