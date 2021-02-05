script generation
generateVersionPropertiesForBatch
	self 
		<< 'rem RELEASE VERSION'; cr;
		<< 'SET "VERSION='; << self release; << '"'; cr;
		<< 'SET "FILES_URL=';<<self fileBaseUrl asString ;<< '/get-files/%VERSION%"'; cr.
