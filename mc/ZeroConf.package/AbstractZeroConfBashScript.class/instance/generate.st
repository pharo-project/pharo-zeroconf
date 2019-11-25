script generation
generate
	self openOutputStream.
	self needsBatchCommandsForWindowsCompatibility
		ifTrue: [ self generateHeaderForBatch ].
	self
		generateHeader;
		cr;
		cr;
		generateHelp;
		cr;
		cr;
		generateBody;
		cr;
		cr.
	self needsBatchCommandsForWindowsCompatibility
		ifTrue: [ self
				generateGoto;
				cr;
				cr;
				generateBodyForBatch;
				cr;
				generateExitForBatchScript;
				cr;
				cr ].
	self needsHtmlHelp
		ifTrue: [ self generateHtmlHelp ].
	outputStream close