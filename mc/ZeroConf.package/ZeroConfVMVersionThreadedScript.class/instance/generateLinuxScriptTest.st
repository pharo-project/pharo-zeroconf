script generation
generateLinuxScriptTest
	super generateLinuxScriptTest.
	self 
		<<== 'REMEMBER ULIMITS REQUIREMENTS'
		<< 'echo "This VM uses a thread heartbeat who requires a special configuration to work."'; cr; 
		<< 'echo "Remember to run ./CONFIG, logout and re-login once, before using pharo."'; cr; 
		<< 'echo "You will need to logout and re-login for changes to take effect"'; cr;
		<< 'echo "cat <<END | sudo tee /etc/security/limits.d/pharo.conf'; cr; 
		<< '*       hard    rtprio  2'; cr; 
		<< '*       soft    rtprio  2'; cr; 
		<< 'END" > ./CONFIG'; cr;
		<< 'chmod +x ./CONFIG'; cr;
		cr.