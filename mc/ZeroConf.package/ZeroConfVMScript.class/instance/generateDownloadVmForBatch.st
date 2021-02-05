script generation
generateDownloadVmForBatch
	self 
		<< ('REM DOWNLOAD THE LATEST ', self type asUppercase, ' VM'); cr.
	self	<< 'SET "VM_URL=' << self vmUrlForBatch << '"
SET "VM_DIR=' << self vmDirectoryPathString << '"

echo "Downloading the latest %VM_TYPE%VM:"
echo "	%VM_URL%"

mkdir %VM_DIR%
call %DOWNLOAD_TO%%VM_DIR%\vm.zip %VM_URL%

pushd %VM_DIR% &  tar -xf vm.zip & popd

SET PHARO_VM=
FORFILES /p %VM_DIR% /s /M %VM_BINARY_NAME_WINDOWS%.exe /C "cmd /c SET PHARO_VM=@path"

del /F %VM_DIR%\vm.zip

echo %PHARO_VM%' ; cr
