Class {
	#name : #BaselineOfZeroConf,
	#superclass : #BaselineOf,
	#category : 'BaselineOfZeroConf'
}

{ #category : #actions }
BaselineOfZeroConf class >> load [ 
	^ self project latestVersion load.
]

{ #category : #accessing }
BaselineOfZeroConf >> baseline: spec [ 
	<baseline>
	
	spec for: #pharo do: [
		self osSubprocess: spec.
		
		spec package: 'ZeroConf'.
		spec package: 'ZeroConf-Tests' with: [ spec requires: #('OSSubprocess') ].
		
		spec group: 'all' with: #('ZeroConf' 'ZeroConf-Tests').
		spec group: 'default' with: #('all') ]	
]

{ #category : #accessing }
BaselineOfZeroConf >> osSubprocess: spec [
	spec 
		baseline: 'OSSubprocess' 
		with: [ spec repository: 'github://pharo-contributions/OSSubprocess:v1.3.0/repository' ]

]
