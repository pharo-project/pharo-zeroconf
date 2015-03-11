script generation
generateDownloadSources
	self
		<<== 'DOWNLOAD THE PHARO ARCHIVED SOURCES FILE';
		<< 'if [ "$OS" = "mac" ]; then
	SOURCES_DIR=$VM_DIR;
else
	SOURCES_DIR=`dirname $PHARO_VM`;
fi

SOURCES_URL="http://files.pharo.org/sources/"

download_sources() {
	echoerr "Downloading $1.sources:"
	echoerr "	$SOURCES_URL/$1.sources.zip"
	$DOWNLOAD_TO$VM_DIR/sources.zip $SOURCES_URL/$1.sources.zip
	unzip -q $VM_DIR/sources.zip -d $SOURCES_DIR
	rm -rf $VM_DIR/sources.zip
}

download_sources PharoV30
download_sources PharoV40'; cr