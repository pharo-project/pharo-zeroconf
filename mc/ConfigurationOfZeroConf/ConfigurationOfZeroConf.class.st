"
Example:

	ConfigurationOfZeroConf load
"
Class {
	#name : #ConfigurationOfZeroConf,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfZeroConf'
}

{ #category : #'development support' }
ConfigurationOfZeroConf class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfZeroConf class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #private }
ConfigurationOfZeroConf class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfZeroConf class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfZeroConf class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfZeroConf class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfZeroConf class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfZeroConf class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfZeroConf class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfZeroConf class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfZeroConf >> baseline10: spec [
	<version: '1.0-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		
		spec repository: 'http://smalltalkhub.com/mc/Pharo/ZeroConf/main/'.
		spec package: 'ZeroConf'.
		
		self commandShell: spec.
	].
]

{ #category : #'external projects' }
ConfigurationOfZeroConf >> commandShell: spec [
	spec project: 'CommandShell' with: [
		spec
			className: 'ConfigurationOfCommandShell';
			version: #stable;
			repository: 'http://www.squeaksource.com/MetacelloRepository' ].
]

{ #category : #'symbolic versions' }
ConfigurationOfZeroConf >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '1.2'.

]

{ #category : #accessing }
ConfigurationOfZeroConf >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self.
		project := constructor project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfZeroConf >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '1.2'.

]

{ #category : #versions }
ConfigurationOfZeroConf >> version10: spec [
	<version: '1.0' imports: #('1.0-baseline' )>

	spec for: #'common' do: [		
		"Common Authors: AndreiChis CamilloBruni EstebanLorenzano"
		spec
			project: 'CommandShell' with: '1.1';
			package: 'ZeroConf' with: 'ZeroConf-GuillermoPolito.52'
	].
]

{ #category : #versions }
ConfigurationOfZeroConf >> version11: spec [
	<version: '1.1' imports: #('1.0-baseline' )>

	spec for: #'common' do: [		
		"Common Authors: AndreiChis CamilloBruni EstebanLorenzano GuillermoPollito "
		spec
			description: 'Use double dash arguments by default';
			project: 'CommandShell' with: '1.1';
			package: 'ZeroConf'     with: 'ZeroConf-CamilloBruni.57'
	].
]

{ #category : #versions }
ConfigurationOfZeroConf >> version12: spec [
	<version: '1.2' imports: #('1.0-baseline' )>

	spec for: #'common' do: [
			"Common Authors: AndreiChis CamilloBruni EstebanLorenzano GuillermoPollito "
		spec
			description: 'Use double dash arguments by default';
			package: 'ZeroConf'     with: 'ZeroConf-PeterUhnak.24'
		].

]
