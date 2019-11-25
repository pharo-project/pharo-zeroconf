script generation
generateVersionPropertiesForBatch
	self 
		<< 'rem RELEASE VERSION';
		<< 'SET "VERSION='; << self release; << '"'; cr;
		<< 'SET "FILES_URL=http://files.pharo.org/get-files/%VERSION%"'; cr.
