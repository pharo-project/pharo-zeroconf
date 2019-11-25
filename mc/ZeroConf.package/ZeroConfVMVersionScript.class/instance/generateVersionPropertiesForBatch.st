script generation
generateVersionPropertiesForBatch
	self 
		<< 'rem RELEASE VERSION'; cr;
		<< 'SET "VERSION='; << self release; << '"'; cr;
		<< 'SET "FILES_URL=http://files.pharo.org/get-files/%VERSION%"'; cr.
