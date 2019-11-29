script generation
generateVersionProperties
	self 
		<<== 'RELEASE VERSION';
		<< 'VERSION="'; << self release; << '"'; cr;
		<< 'FILES_URL="';<<self fileBaseUrl asString ;<< '/get-files/${VERSION}"'; cr.
