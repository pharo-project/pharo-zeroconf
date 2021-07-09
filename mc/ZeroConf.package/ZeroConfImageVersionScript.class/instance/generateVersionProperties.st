script generation
generateVersionProperties

	self <<== 'RELEASE VERSION'.
	platform generateArchitectureDetectionOn: self.
	self cr
		<< 'VERSION="'; << self release asString; << '"'; cr;
		<< 'FILES_URL="http://files.pharo.org/get-files/${VERSION}"'; cr;
		<< 'IMAGE_FILE_NAME="'; << self imageFileName; << '-${ARCH}"'; cr.