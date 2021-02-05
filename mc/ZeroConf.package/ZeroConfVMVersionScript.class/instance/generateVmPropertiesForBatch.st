script generation
generateVmPropertiesForBatch 
	super generateVmPropertiesForBatch.
	self << 'SET "VM_STATUS='; << self status; << '"'; cr.