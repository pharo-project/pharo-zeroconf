versions
version12: spec
	<version: '1.2' imports: #('1.0-baseline' )>

	spec for: #'common' do: [
			"Common Authors: AndreiChis CamilloBruni EstebanLorenzano GuillermoPollito "
		spec
			description: 'Use double dash arguments by default';
			package: 'ZeroConf'     with: 'ZeroConf-PeterUhnak.24'
		].
