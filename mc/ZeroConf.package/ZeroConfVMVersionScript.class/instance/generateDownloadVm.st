script generation
generateDownloadVm
	self 
		<<== ('DOWNLOAD {1} FOR {2} VM' format: { self type asUppercase. self release asString })
		<< ('VM_URL="{1}"' format: { self vmUrl }); cr;
		<< ('VM_DIR="{1}"' format: { self vmDirectoryPathString }); cr;
		<< '
echoerr "Downloading the latest ${VM_TYPE}VM:"
echoerr "	$VM_URL"

mkdir -p $VM_DIR
$DOWNLOAD_TO$VM_DIR/vm.zip $VM_URL

unzip -q $VM_DIR/vm.zip -d $VM_DIR
rm -rf $VM_DIR/vm.zip

if [ "$OSNAME" == "Windows" ]; then
    PHARO_VM=`find $VM_DIR -name ${VM_BINARY_NAME_WINDOWS}.exe`
elif [ "$OSNAME" == "Darwin" ]; then
    PHARO_VM=`find $VM_DIR -name ${VM_BINARY_NAME}`
elif [ "$OSNAME" == "Linux" ]; then
    PHARO_VM=`ls $VM_DIR/${VM_BINARY_NAME_LINUX}`
fi

echo $PHARO_VM'; cr