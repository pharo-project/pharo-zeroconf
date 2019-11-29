accessing
vmUrl
	^self vmBaseUrl asString ,'/${VM_TYPE}/${OS}/' , self release , '.zip'