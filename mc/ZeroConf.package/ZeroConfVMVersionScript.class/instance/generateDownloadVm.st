script generation
generateDownloadVm
	self 
		<<== ('DOWNLOAD {1} FOR {2} VM' format: { self type asUppercase. self release asString })
		<< ('VM_URL="{1}"' format: { self vmUrl }); cr;
		<< ('VM_DIR="{1}"' format: { self vmDirectoryPathString }); cr;
		<< '
echoerr "Downloading the latest ${VM_TYPE}VM:"
echoerr "	$VM_URL"'; cr.

	self generateDownloadVmInstructions 