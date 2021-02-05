script generation
generateVersionProperties
	self 
		<<== 'RELEASE VERSION';
		<< 'FILES_URL="';<<self fileBaseUrl asString ;<< '/get-files/${VERSION}"'; cr;
		<< 'IMAGE_FILE_NAME="'; << self imageFileName; << '"'; cr.