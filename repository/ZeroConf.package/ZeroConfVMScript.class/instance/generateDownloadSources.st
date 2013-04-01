script generation
generateDownloadSources
	self
		<<== 'DOWNLOAD THE PHARO ARCHIVED SOURCES FILE';
		<< 'if [ "$OS" = "mac" ]; then
	SOURCES_DIR=$VM_DIR;
else
	SOURCES_DIR=`dirname $PHARO_VM`;
fi

SOURCES_URL="http://files.pharo.org/image/"

download_sources() {
	echoerr "Downloading $1.sources:"
	echoerr "	$SOURCES_URL/$1.sources.zip"
	wget --quiet --output-document=$VM_DIR/sources.zip $SOURCES_URL/$1.sources.zip
	unzip -q -d $SOURCES_DIR $VM_DIR/sources.zip
	rm -rf $VM_DIR/sources.zip
}

download_sources PharoV10 
download_sources PharoV20'; cr