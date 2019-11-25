script generation
generateHeaderForBatch
	self
		<< ':<<"::CMDLITERAL"';
		cr;
		<< '@ECHO OFF';
		cr;
		<< 'GOTO :CMDSCRIPT';
		cr;
		<< '::CMDLITERAL';
		cr