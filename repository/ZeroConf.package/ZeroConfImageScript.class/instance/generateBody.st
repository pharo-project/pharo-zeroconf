script generation
generateBody
	self
		<<== ('DOWNLOADING THE LATEST PHARO ', self release asString, ' IMAGE');
		<< 'IMAGE_URL="'; print: self imageUrl; <<'"'; cr; cr;
		<< 'echoerr "Downloading the latest '; << self release; << ' Image:"
echoerr "    $IMAGE_URL"

TMP_DIR=`mktemp -d image.XXXXX`
wget --quiet --output-document=$TMP_DIR/image.zip $IMAGE_URL

unzip -q -d $TMP_DIR $TMP_DIR/image.zip
rm -rf image image.zip

PHARO_IMAGE=`find $TMP_DIR -name \*.image`
mv "$PHARO_IMAGE" Pharo.image

PHARO_CHANGES=`find $TMP_DIR -name \*.changes`
mv "$PHARO_CHANGES" Pharo.changes;

rm -r $TMP_DIR >> /dev/null

echo $PHARO_IMAGE'; cr