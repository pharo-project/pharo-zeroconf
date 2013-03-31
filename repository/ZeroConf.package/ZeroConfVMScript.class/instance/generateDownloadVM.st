script generation
generateDownloadVM
	self 
		<<== ('DOWNLOAD THE LATEST ', self type asUppercase, ' VM');
		<< 'VM_URL="http://files.pharo.org/vm/${VM_TYPE}/${OS}/${VM_TYPE}-${OS}-'; << self release; << '.zip"
VM_DIR="'; << self vmDirectory fullName; << '"

echoerr "Downloading the latest ${VM_TYPE}VM:"
echoerr "	$VM_URL"

wget --quiet --output-document=$VM_DIR/vm.zip $VM_URL
mkdir $VM_DIR

unzip -q -d $VM_DIR $VM_DIR/vm.zip
rm -rf $VM_DIR/vm.zip

if [ "$OS" == "win" ]; then
    PHARO_VM=`find vm -name ${VM_BINARY_NAME}.exe`
elif [ "$OS" == "mac" ]; then
    PHARO_VM=`find vm -name ${VM_BINARY_NAME}`
elif [ "$OS" == "linux" ]; then
    PHARO_VM=`find vm -name ${VM_BINARY_NAME_LINUX}`
fi

echo $PHARO_VM'; cr