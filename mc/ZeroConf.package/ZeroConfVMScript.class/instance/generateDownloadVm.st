script generation
generateDownloadVm
	self 
		<<== ('DOWNLOAD THE LATEST ', self type asUppercase, ' VM')
		<< 'VM_URL="' << self vmUrl << '"
VM_DIR="' << self vmDirectoryPathString << '"

echoerr "Downloading the latest ${VM_TYPE}VM:"
echoerr "	$VM_URL"'; cr.

	self generateDownloadVmInstructions