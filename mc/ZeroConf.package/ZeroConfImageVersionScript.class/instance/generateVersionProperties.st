script generation
generateVersionProperties
	self 
		<<== 'RELEASE VERSION';
		<< 'VERSION="'; << self release; << '"'; cr;
		<< 'FILES_URL="http://files.pharo.org/get-files/${VERSION}"'; cr;
		<< 'IMAGE_FILE_NAME="'; << self imageFileName; << '"'; cr.