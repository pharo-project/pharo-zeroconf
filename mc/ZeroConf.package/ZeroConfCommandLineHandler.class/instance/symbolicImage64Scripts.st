accessing scripts 64
symbolicImage64Scripts
	^ { 
		(ZeroConfImageVersionScript pharo: self class stable64Version) be64bits
			basename: 'stable';
			yourself.
		(ZeroConfImageVersionScript pharo: self class alpha64Version) be64bits
			basename: 'alpha';
			yourself }