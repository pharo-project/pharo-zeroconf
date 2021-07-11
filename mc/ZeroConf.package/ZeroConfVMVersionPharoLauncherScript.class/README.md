I'm there temporary to be able to fetch a signed VM on Windows (used by Pharo Launcher).
for example:
	get-files/{version}/pharo-stable.zip
	get-files/{version}/pharo-stable-signed.zip

Generate bash scripts:
dir := FileLocator temp asFileReference.
ZeroConfVMVersionPharoLauncherScript pharoLauncher61 
	directory: dir;
	be64bits;
	generate.
ZeroConfVMVersionPharoLauncherScript pharoLauncher61 
	directory: dir;
	generate.
dir