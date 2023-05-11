Extension { #name : #ZeroConfCombinedScript }

{ #category : #'*ZeroConf-Tests-validation' }
ZeroConfCombinedScript >> validateGeneratedArtifacts [
	"cannot test combined scripts as they download the other scripts from the server	which most probably are still using the old data. Hence they might produce outdated	artifacts."
]

{ #category : #'*ZeroConf-Tests-validation' }
ZeroConfCombinedScript >> validateRun [
	"cannot test combined scripts as they download the other scripts from the server	which most probably are still using the old data. Hence they might produce outdated	artifacts."
]
