script generation
generateVersionPropertiesForBatch	self 
		<< 'REM RELEASE VERSION'; cr;
		<< 'SET "VERSION='; << self release asString ; << '"'; cr;
		<< 'SET "FILES_URL=';<<self fileBaseUrl asString ;<< '/get-files/%VERSION%"'; cr;
		<< 'SET "IMAGE_FILE_NAME='; << self imageFileName; << '"'; cr.