script generation
generateGoto
	self
		<< 'exit $?';
		cr;
		cr;
		<< '# Here is the batch script.';
		cr;
		<< ':CMDSCRIPT';
		cr;
		cr; 
		generateHelperMethodsForBatch 