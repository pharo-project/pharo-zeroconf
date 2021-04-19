script generation
generateDetectSystemProperties
	self 
		<<== 'DETECT SYSTEM PROPERTIES';
		generatePlatformTest;
		<< 'VM_ARCH=`uname -m`'; cr;
		<< 'OSNAME=`uname -o`'; cr