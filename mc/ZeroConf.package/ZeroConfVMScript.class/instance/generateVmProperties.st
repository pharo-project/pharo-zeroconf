script generation
generateVmProperties
	self 
		<<== 'VM PROPERTIES';
		<< 'VM_TYPE="'; << self type; << '"'; cr;
		<< 'VM_BINARY_NAME="'; << self binaryName; << '"'; cr;
		<< 'VM_BINARY_NAME_LINUX="'; << self binaryNameLinux; << '"'; cr;
		<< 'VM_BINARY_NAME_WINDOWS="'; << self binaryNameWindows; << '"'; cr