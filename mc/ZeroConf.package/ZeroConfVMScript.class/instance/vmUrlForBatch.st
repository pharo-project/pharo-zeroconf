accessing
vmUrlForBatch
		^self vmBaseUrl asString ,'/%VM_TYPE%/%OS%/' , self release , '.zip'