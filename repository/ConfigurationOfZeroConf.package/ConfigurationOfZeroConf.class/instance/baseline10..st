baselines
baseline10: spec
	<version: '1.0-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		
		self commandShell: spec.
		
		spec repository: 'http://smalltalkhub.com/mc/Pharo/ZeroConf/main/'.
		spec package: 'ZeroConf'.
	].