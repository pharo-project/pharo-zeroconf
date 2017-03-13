script generation
generateDownloadVm
	self 
		<<== ('DOWNLOAD THE LATEST ', self type asUppercase, ' VM')
		<< 'VM_URL="' << self vmUrl << '"
VM_DIR="' << self vmDirectoryPathString << '"

echoerr "Downloading the latest ${VM_TYPE}VM:"
echoerr "	$VM_URL"

mkdir $VM_DIR
$DOWNLOAD_TO$VM_DIR/vm.zip $VM_URL

unzip -q $VM_DIR/vm.zip -d $VM_DIR
rm -rf $VM_DIR/vm.zip

if [ "$OS" == "win" ]; then
    PHARO_VM=`find $VM_DIR -name ${VM_BINARY_NAME_WINDOWS}.exe`
elif [ "$OS" == "mac" ]; then
    PHARO_VM=`find $VM_DIR -name ${VM_BINARY_NAME}`
elif [ "$OS" == "linux" ]; then
    PHARO_VM=`find $VM_DIR -name ${VM_BINARY_NAME_LINUX}`
fi

echo $PHARO_VM'; cr