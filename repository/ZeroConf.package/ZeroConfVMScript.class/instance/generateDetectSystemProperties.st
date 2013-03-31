script generation
generateDetectSystemProperties
	self 
		<<== 'DETECT SYSTEM PROPERTIES';
		generatePlatformTest; cr;
		generateArchitectureTest