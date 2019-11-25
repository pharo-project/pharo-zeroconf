script generation
generateDetectSystemPropertiesForBatch
	self
		<< 'REM DETECT SYSTEM PROPERTIES';
		cr;
		cr;
		<< 'REM Who else that Windows OS will run a bat file?';
		cr;
		<< 'SET "OS=win"';
		cr