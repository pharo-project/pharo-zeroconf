Extension { #name : #AbstractZeroConfBashScript }

{ #category : #'*ZeroConf-Tests-running' }
AbstractZeroConfBashScript >> redirectOutputOfProcess: process [
	"Creates a simple process that reads stderr from another process and forwards it to stderr of the running image"
	
	^ [ | stderr |
		stderr := FileStream stderr.
		[ process pipeFromError ifNotNil: [ :pipe | 
			[stderr
				nextPutAll: (pipe next: 16);
				flush ]
			on: Error do: [ :err | 
				"nothing"
			]
		]] repeat ] fork
]

{ #category : #'*ZeroConf-Tests-running' }
AbstractZeroConfBashScript >> run [
	OSSUnixSubprocess new
		command: 'bash';
		workingDirectory: self directory fullName;
		arguments: { self basename };
		redirectStdout;
		runAndWaitOnExitDo: [ :process :outString  |
			self 
				assert: process isSuccess
				description: self file fullName , ' did not succeed'
		].

]

{ #category : #'*ZeroConf-Tests-validation' }
AbstractZeroConfBashScript >> validate [
	"validate the generated script"
	self
		validateGenerate;
		validateScript.
	self
		validateRun; 
		validateGeneratedArtifacts.
]

{ #category : #'*ZeroConf-Tests-validation' }
AbstractZeroConfBashScript >> validateGenerate [
	^ self generate
]

{ #category : #'*ZeroConf-Tests-validation' }
AbstractZeroConfBashScript >> validateGeneratedArtifacts [
	| generatedArtifacts expectedArtifacts |
					
	expectedArtifacts := ({ self basename }, self artifacts) sorted.
	expectedArtifacts := expectedArtifacts collect: [ :artifactName | artifactName asFileReference basename ].
	generatedArtifacts := self directory childNames sort.
	
	generatedArtifacts
		ifEmpty: [ ^ self exitFailure: self file fullName, ' did not generate any content' ].
	
	generatedArtifacts = expectedArtifacts
		ifFalse: [  ^ self exitFailure: (String streamContents: [ :stream | 
			stream << self file fullName;
				<< ' did not generate the approriate files:'; lf;
				<< '    missing:   '; print: (expectedArtifacts \ generatedArtifacts);
				<< '    additional: '; print: (generatedArtifacts \ expectedArtifacts) ])].
]

{ #category : #'*ZeroConf-Tests-validation' }
AbstractZeroConfBashScript >> validateRun [
	[ self run ]	
		valueWithin: self validationTimeout 
		onTimeout: [ 
			AssertionFailure signal: (String streamContents: [ :stream|
				stream 
					<< 'Timeout: '; print: self  file; 
					<< ' took longer than '; print: self validationTimeout; << ' to finish' ])]
]

{ #category : #'*ZeroConf-Tests-validation' }
AbstractZeroConfBashScript >> validateScript [
	self 
		assert: self file isFile
		description: self file fullName, ' was not exported'.
		
	self 
		assert: self file readStream contents size > 0
		description: self file fullName, ' was not exported'.
		
	
]

{ #category : #'*ZeroConf-Tests-validation' }
AbstractZeroConfBashScript >> validationTimeout [
	^ 30 seconds
]
