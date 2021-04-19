script generation
generateVersionProperties
	self 
		<<== 'RELEASE VERSION';
		<< 'ARCH=`uname -m`';
		<< 'VERSION="'; << self release; << '"'; cr;
		<< 'FILES_URL="http://files.pharo.org/get-files/${VERSION}"'; cr;
		<< 'IMAGE_FILE_NAME="'; << self imageFileName; << '-${ARCH}"'; cr.