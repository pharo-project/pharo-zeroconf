script generation
generateBody
	self
		<<== ('DOWNLOADING THE LATEST ', self imageName asUppercase, ' ' , self release asString, ' IMAGE');
		<< 'IMAGE_URL="'; << self imageUrl; <<'"'; cr; cr;
		<< 'echoerr "Downloading the latest '; << self release; << ' Image:"
echoerr "    $IMAGE_URL"

TMP_DIR=`mktemp -d image.XXXXXX`
$DOWNLOAD_TO$TMP_DIR/image.zip $IMAGE_URL

unzip -q $TMP_DIR/image.zip -d $TMP_DIR
rm -rf image image.zip

PHARO_IMAGE=`find $TMP_DIR -name \*.image`
mv -i "$PHARO_IMAGE" '; << self imageName; <<'.image

PHARO_CHANGES=`find $TMP_DIR -name \*.changes`
mv -i "$PHARO_CHANGES" '; << self imageName; <<'.changes;'.

	(self release >= 70) 
		ifTrue: [ self cr; << '
PHARO_IMAGE_SOURCES=`find $TMP_DIR -name \*.sources`
PHARO_IMAGE_SOURCES_FILENAME=$(basename "$PHARO_IMAGE_SOURCES")
mv -i "$PHARO_IMAGE_SOURCES" "$PHARO_IMAGE_SOURCES_FILENAME"'; cr. ].
	
	self << '
rm -r $TMP_DIR >> /dev/null

echo '; << self imageName; <<'.image'; cr