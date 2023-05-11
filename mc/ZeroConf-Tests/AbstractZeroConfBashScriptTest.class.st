"
I am an abstract test for the ZeroConf script generators.
I provide simple test for a given zeroconf script, see the methods in the 'helper testing' category.
"
Class {
	#name : #AbstractZeroConfBashScriptTest,
	#superclass : #ClassTestCase,
	#instVars : [
		'script'
	],
	#category : 'ZeroConf-Tests'
}

{ #category : #accessing }
AbstractZeroConfBashScriptTest class >> defaultTimeLimit [
	^ 1 minute
]

{ #category : #testing }
AbstractZeroConfBashScriptTest class >> isAbstract [ 
	^ self = AbstractZeroConfBashScriptTest
]

{ #category : #helper }
AbstractZeroConfBashScriptTest >> cleanUp [
	script artifacts do: [ :artifact|
		artifact asFileReference ensureDelete ]
]

{ #category : #'helper testing' }
AbstractZeroConfBashScriptTest >> generateTest [
	"Test if the given ZeroConfBashScript generates a proper bash script"
	script generate.
	self assert: script file exists.
	self assert: script file readStream contents size > 0
]

{ #category : #'helper testing' }
AbstractZeroConfBashScriptTest >> helpTest [
	"Test if the generate ZeroConf script successfully runs with --help"
	OSSUnixSubprocess new
		command: 'bash';
		arguments: {script file fullName . '--help'};
		redirectStdout;
		runAndWaitOnExitDo: [ :process :outString  |
			self assert: process isSuccess.
		]
]

{ #category : #helper }
AbstractZeroConfBashScriptTest >> runScriptTest: aScript [
	| testDirectory |
	script := aScript.
	testDirectory := 'zeroconf-test' asFileReference.
	testDirectory ensureDeleteAll; ensureCreateDirectory.
	script directory: testDirectory.
	self 
		generateTest;
		helpTest;
		runTest;
		cleanUp.
]

{ #category : #'helper testing' }
AbstractZeroConfBashScriptTest >> runTest [
	"Test if the generate ZeroConf script successfully runs and creates the artifacts"
	self flag: #todo.
	script validateRun.
	script artifacts do: [ :artifact|
		self assert: (script directory / artifact) exists ]
]
