script generation
generateVmPropertiesForBatch
	self 
		<< 'REM VM PROPERTIES'; cr;
		<< 'SET "VM_TYPE='; << self type; << '"'; cr;
		<< 'SET "VM_ARCH='; << self arch; << '"'; cr;
		<< 'SET "VM_BINARY_NAME='; << self binaryName; << '"'; cr;
		<< 'SET "VM_BINARY_NAME_LINUX='; << self binaryNameLinux; << '"'; cr;
		<< 'SET "VM_BINARY_NAME_WINDOWS='; << self binaryNameWindows; << '"'; cr