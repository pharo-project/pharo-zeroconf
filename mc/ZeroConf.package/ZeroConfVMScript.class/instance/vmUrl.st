accessing
vmUrl
	^'http://files.pharo.org/vm/${VM_TYPE}/${OS}${LIBC}/' , self release , '.zip'