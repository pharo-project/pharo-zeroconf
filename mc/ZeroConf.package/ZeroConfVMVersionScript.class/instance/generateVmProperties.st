script generation
generateVmProperties
	super generateVmProperties.
	self << 'VM_STATUS="'; << self status; << '"'; cr.