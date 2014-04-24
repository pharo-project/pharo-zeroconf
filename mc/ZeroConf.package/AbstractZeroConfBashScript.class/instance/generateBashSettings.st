script generation
generateBashSettings
	self 
		<< '# stop the script if a single command fails'; cr;
		<< 'set -e'; cr