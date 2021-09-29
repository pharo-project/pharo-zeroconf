script generation
generateDownloadVm
	self 
		<<== ('DOWNLOAD signed (if available) {2} VM' format: { self type asUppercase. self release })
		<< 'if [ "$OSNAME" == "Windows" ]; then'; cr;
		<< ('    VM_URL="{1}"' format: { self winVmUrl }); cr;
		<< 'else'; cr;
		<< ('    VM_URL="{1}"' format: { self vmUrl }); cr;
		<< 'fi'; cr;
		<< ('VM_DIR="{1}"' format: { self vmDirectoryPathString }); cr;
		<< '
echoerr "Downloading ${VM_TYPE}VM:"
echoerr "	$VM_URL"'; cr.

	self generateDownloadVmInstructions 