script generation
generateHelperMethodsForBatch
	self
		<< 'SETLOCAL EnableExtensions';
		cr;
		<< 'SETLOCAL EnableDelayedExpansion';
		cr;
		generateCurlWgetDetectForBatch;
		cr;
		cr