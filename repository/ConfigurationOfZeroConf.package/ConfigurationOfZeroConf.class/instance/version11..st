versions
version11: spec
	<version: '1.1' imports: #('1.0-baseline' )>

	spec for: #'common' do: [		
		"Common Authors: AndreiChis CamilloBruni EstebanLorenzano"
		spec
			description: 'Use double dash arguments by default';
			project: 'CommandShell' with: '1.1';
			package: 'ZeroConf'     with: 'ZeroConf-CamilloBruni.53'
	].