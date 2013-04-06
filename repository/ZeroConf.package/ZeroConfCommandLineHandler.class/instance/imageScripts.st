accessing
imageScripts
	^ self imageVersions collect: [ :version|
		ZeroConfPharoImageScript pharo: version ]