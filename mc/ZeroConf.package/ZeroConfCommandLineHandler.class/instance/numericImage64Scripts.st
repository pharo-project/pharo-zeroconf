accessing scripts 64
numericImage64Scripts
	^ self image64Versions 
		collect: [ :version | (ZeroConfImageVersionScript pharo: version) be64bits ]