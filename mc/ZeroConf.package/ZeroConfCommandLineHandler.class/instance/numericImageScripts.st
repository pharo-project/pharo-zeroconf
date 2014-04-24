accessing
numericImageScripts
	^ self imageVersions collect: [ :version|
		ZeroConfPharoImageScript pharo: version ]