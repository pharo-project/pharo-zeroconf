script generation
generateDownloadSources
	self
		<<== 'DOWNLOAD THE PHARO ARCHIVED SOURCES FILE';
		<< 'if [ "$OS" = "mac" ]; then
	SOURCES_DIR=$VM_DIR;
else
	SOURCES_DIR=`dirname $PHARO_VM`;
fi

echoerr "Downloading PharoV${VERSION}.sources:"
echoerr "	$FILES_URL/sources.zip"
$DOWNLOAD_TO$VM_DIR/sources.zip $FILES_URL/sources.zip
unzip -q $VM_DIR/sources.zip -d $SOURCES_DIR
rm -rf $VM_DIR/sources.zip'; cr