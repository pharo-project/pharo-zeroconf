script generation
generateDownloadVm
	self 
		<<== ('DOWNLOAD signed (if available) {2} VM' format: { self type asUppercase. self release })
		<< 'if [ "$OS" == "win" ]; then'; cr;
		<< ('    VM_URL="{1}"' format: { self winVmUrl }); cr;
		<< 'else'; cr;
		<< ('    VM_URL="{1}"' format: { self vmUrl }); cr;
		<< 'fi'; cr;
		<< ('VM_DIR="{1}"' format: { self vmDirectoryPathString }); cr;
		<< '
echoerr "Downloading ${VM_TYPE}VM:"
echoerr "	$VM_URL"

mkdir -p $VM_DIR
$DOWNLOAD_TO$VM_DIR/vm.zip $VM_URL

unzip -q $VM_DIR/vm.zip -d $VM_DIR
rm -rf $VM_DIR/vm.zip

if [ "$OS" == "win" ]; then
    PHARO_VM=`find $VM_DIR -name ${VM_BINARY_NAME_WINDOWS}.exe`
elif [ "$OS" == "mac" ]; then
    PHARO_VM=`find $VM_DIR -name ${VM_BINARY_NAME}`
elif [ "$OS" == "linux" ]; then
    PHARO_VM=`ls $VM_DIR/${VM_BINARY_NAME_LINUX}`
fi

echo $PHARO_VM'; cr