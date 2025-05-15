"
Usage: zeroconf [ --output=<DIR> ] [ --test ]
    --output=    Output the zeroconf scripts to <DIR> instead of the current working directory
	--test        Run each generated script to ensure it works
	
Description:
I generate zeroconf commandline scripts next to the current image.
"
Class {
	#name : 'ZeroConfCommandLineHandler',
	#superclass : 'CommandLineHandler',
	#instVars : [
		'outputDirectory'
	],
	#category : 'ZeroConf',
	#package : 'ZeroConf'
}

{ #category : 'accessing' }
ZeroConfCommandLineHandler class >> alphaVersion [
 
	^ 140
]

{ #category : 'accessing' }
ZeroConfCommandLineHandler class >> commandName [

	^ 'zeroconf'
]

{ #category : 'accessing' }
ZeroConfCommandLineHandler class >> description [

	^ 'Generate Pharo zeroconf bash scripts'
]

{ #category : 'helper' }
ZeroConfCommandLineHandler class >> generate [
	<script>

	self generateInDirectory: (FileLocator imageDirectory / 'out') asFileReference
]

{ #category : 'helper' }
ZeroConfCommandLineHandler class >> generateInDirectory: aReference [

	self new
		commandLine: (CommandLineArguments withArguments: {'--output=', aReference fullName});
		generateScripts
]

{ #category : 'accessing' }
ZeroConfCommandLineHandler class >> image64Versions [

	^ #(140 130 120 110 100 90 80 70 61 60)
]

{ #category : 'accessing' }
ZeroConfCommandLineHandler class >> imageVersions [

	^ #(140 130 120 110 100 90)
]

{ #category : 'accessing' }
ZeroConfCommandLineHandler class >> stable64Version [ 

	^ 130
]

{ #category : 'accessing' }
ZeroConfCommandLineHandler class >> stableVersion [
 
	^ self stable64Version
]

{ #category : 'private' }
ZeroConfCommandLineHandler class >> subdir64 [
	"subdirectory for 64bits"
	^ '64'
]

{ #category : 'activation' }
ZeroConfCommandLineHandler >> activate [
	self activateHelp
		ifTrue: [ ^ self ].
	
	self outputDirectory ensureCreateDirectory.
	
	(self hasOption: 'test')
		ifTrue: [ self testScripts ]
		ifFalse:[ self generateScripts ].
	
	self
		exitSuccess
]

{ #category : 'actions testing' }
ZeroConfCommandLineHandler >> cleanUpAfterScript: aScript [
	self testDirectory deleteAllChildren
]

{ #category : 'accessing scripts' }
ZeroConfCommandLineHandler >> combinedScripts [
	^ Array streamContents: [ :stream |
		(self imageScripts 
			select: #canBeCombined)
			do: [ :each | 
				(self vmScriptsVersion: each release)
					do: [ :vm | stream nextPut: each, vm ] ] ]
]

{ #category : 'accessing scripts' }
ZeroConfCommandLineHandler >> defaultScript [
	^ (ZeroConfImageVersionScript pharo: self class stableVersion), 
	  (ZeroConfVMVersionScript pharo: self class stableVersion status: #stable) 
]

{ #category : 'actions testing' }
ZeroConfCommandLineHandler >> ensureEmptyTestDirectory [
	self testDirectory exists
		ifFalse: [ ^ self testDirectory ensureDirectory ].
		
	self testDirectory isFile
		ifTrue: [ ^ self exitFailure: 'Test output directory ', self testDirectory fullName, ' is an exising file.' ].
		
	self testDirectory hasChildren
		ifTrue: [ ^ self exitFailure: 'Test output directory ', self testDirectory fullName, ' is not empty.' ].
]

{ #category : 'actions generating' }
ZeroConfCommandLineHandler >> generate: script [ 
	self setScriptDirectory: script.
	script directory ensureCreateDirectory.
	
	self stdout nextPutAll: script basename; lf.
	script 
		ensureDelete;
		generate.
]

{ #category : 'actions generating' }
ZeroConfCommandLineHandler >> generateScripts [
	self scripts do: [ :script | self generate: script ].
	self generate: self indexScript
]

{ #category : 'accessing scripts' }
ZeroConfCommandLineHandler >> imageScripts [
	^ self symbolicImageScripts, self numericImageScripts, self minimalScripts
]

{ #category : 'accessing' }
ZeroConfCommandLineHandler >> imageVersions [
	^ self class imageVersions
]

{ #category : 'accessing scripts' }
ZeroConfCommandLineHandler >> indexScript [
	"the index.html is a special script that downloads the current stable release of Pharo with the VM.
	Additionally it has a complete list of exported scripts in the html help"
	| indexScript |
	indexScript := self defaultScript. 
	indexScript additionalHtmlHelp: (String streamContents: [ :s |
		self indexScriptExamplesHtmlOn: s.
		self otherScriptsHtmlOn: s ] ).
	indexScript 
		basename: 'index.html';
		url: indexScript baseUrl.
	^ indexScript.
]

{ #category : 'accessing' }
ZeroConfCommandLineHandler >> indexScriptExamplesHtmlOn: s [ 
	s << '<h2>Pharo Example</h2>'; cr;
	<< '<table>

<tr>
<td>Show the command line help:</td>
<td><code>./pharo Pharo.image --help</code></td>
</tr>

<tr>			
<td>List all command line handlers:</td>
<td><code>./pharo Pharo.image --list</code></td>
</tr>

<tr>			
<td>Evaluate an expression on the command line:</td>
<td><code>./pharo Pharo.image eval "Class allInstances"</code></td>
</tr>

</table>'.
]

{ #category : 'accessing scripts' }
ZeroConfCommandLineHandler >> minimalScripts [
	^ (self imageVersions 
		select: [ :each | ZeroConfMinimalImageVersionScript canBeGenerated: each ]) 
		collect: [ :each | ZeroConfMinimalImageVersionScript pharo: each ]
]

{ #category : 'accessing scripts' }
ZeroConfCommandLineHandler >> numericImageScripts [
	^ self imageVersions collect: [ :version|
		ZeroConfImageVersionScript pharo: version ]
]

{ #category : 'accessing' }
ZeroConfCommandLineHandler >> otherScriptsHtmlOn: stream [
	stream
		<< '<h2>Other Versions</h2>'; cr;
		<< '<table>'.
	stream
		<< '<tr>';
		<< '<td>Other versions are available in the form, where version=90,80,70...</td>';
		<< '<td><code>curl https://get.pharo.org/[version]+vm | bash</code></td>';
		<< '</tr><tr>';
		<< '<td>Getting explicitly a 64bit or 32 bit version requires the 32 or 64 prefix</td>';
		<< '<td><code>curl https://get.pharo.org/[32/64]/[version]+vm | bash</code></td>';
		<< '</tr><tr>';
		<< '<td>Older versions can be found at</td>';
		<< '<td><a href="https://get.pharo.org/archive/80">https://get.pharo.org/archive/80</a></td>';
		<< '</tr>'.
	stream << '</table>'
]

{ #category : 'accessing' }
ZeroConfCommandLineHandler >> outputDirectory [
	^ outputDirectory ifNil: [ 
		outputDirectory := (self hasOption: 'output')
			ifTrue: [ (self optionAt: 'output') asFileReference ]
			ifFalse: [ FileSystem workingDirectory ]]
]

{ #category : 'accessing' }
ZeroConfCommandLineHandler >> outputDirectory: anOutputDirectory [
	outputDirectory := anOutputDirectory
]

{ #category : 'actions testing' }
ZeroConfCommandLineHandler >> printTestStartOfScript: aScript [
	| message |
	message := 'Testing ', aScript file fullName.
	self stderr
		yellow: message; lf;
		yellow: ('' padLeftTo: message size with: $=); lf.
]

{ #category : 'accessing scripts' }
ZeroConfCommandLineHandler >> scripts [
	"The base scripts work by looking at the current architecture.
	Generate scripts that explicitly search for the corresponding 32 and 64 bit versions"
	| baseScripts |
	baseScripts := self imageScripts, self vmScripts, self combinedScripts.
	baseScripts := baseScripts, (baseScripts collect: [:script | script for32Bits ]).
	baseScripts := baseScripts, (baseScripts collect: [:script | script for64Bits ]).
	^ baseScripts
]

{ #category : 'accessing' }
ZeroConfCommandLineHandler >> setScriptDirectory: script [
	script baseDirectory ifNil: [ 
		script directory: self outputDirectory ].
	^ script
]

{ #category : 'accessing scripts' }
ZeroConfCommandLineHandler >> symbolicImageScripts [
	"manually mark a stable and an unstable alpha release"
	^ { 
		(ZeroConfImageVersionScript pharo: self class stableVersion)
			basename: 'stable';
			yourself.
		(ZeroConfImageVersionScript pharo: self class alphaVersion)
			basename: 'alpha';
			yourself. }
]

{ #category : 'actions testing' }
ZeroConfCommandLineHandler >> test: aScript [	
	self printTestStartOfScript: aScript.
	
	aScript directory: self testDirectory.
		
	[ aScript validate ] 
		ensure: [ self cleanUpAfterScript: aScript ]
	
]

{ #category : 'accessing' }
ZeroConfCommandLineHandler >> testDirectory [
	^ self outputDirectory / 'test'
]

{ #category : 'actions testing' }
ZeroConfCommandLineHandler >> testScripts [	
	self 
		ensureEmptyTestDirectory.
	
	self scripts do: [ :script |
		self test: script ].
	
	self test: self indexScript.
]

{ #category : 'accessing' }
ZeroConfCommandLineHandler >> testTimeout [
	"Timeout used when testing scripts. Each script is guaranteed only this much time before it is aborted."
	^ 30 seconds
]

{ #category : 'accessing scripts' }
ZeroConfCommandLineHandler >> vmScripts [
	^ self imageVersions flatCollect: [ :each | self vmScriptsVersion: each ]
]

{ #category : 'accessing scripts' }
ZeroConfCommandLineHandler >> vmScriptsVersion: version [
	| scripts |
	
	scripts := { 
		ZeroConfVMVersionScript stablePharo: version }.

	"Just alpha versions have unstable vms (once released, vm freezes)"
	version = self class alphaVersion ifTrue: [ 
		scripts := scripts copyWith: (ZeroConfVMVersionScript latestPharo: version) ].

	^ scripts
]
