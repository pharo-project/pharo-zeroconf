script generation
generateBodyForBatch
	self
		<< ('rem DOWNLOADING THE LATEST ', self imageName asUppercase, ' ' , self release asString, ' IMAGE'); cr;
		<< 'SET "IMAGE_URL='; << self imageUrlForBatch asString; <<'"'; cr; cr.
self 
<< 'SETLOCAL EnableExtensions
REM Get unique file name 
:uniqLoop
set "TMP_DIR=%tmp%\image.%RANDOM%.tmp"
if exist "%TMP_DIR%" goto :uniqLoop
mkdir %TMP_DIR%

call %DOWNLOAD_TO%%TMP_DIR%\image.zip %IMAGE_URL%

pushd %TMP_DIR% &  tar -xf %TMP_DIR%\image.zip & popd
del /F /Q image image.zip

if not exist ['; << self imageName; << '.image] (
	SET "BKDATE=%date:~6,4%%date:~3,2%%date:~0,2%%time:~0,2%%time:~3,2%"
	copy /Y '; << self imageName; << '.image '; << self imageName; << '.image.bak.%BKDATE%
	copy /Y '; << self imageName; << '.changes '; << self imageName; << '.changes.bak.%BKDATE%
)
	
FORFILES /p %TMP_DIR% /s /M *.image /C "cmd /c move /Y @path %CD%\'; << self imageName; <<'.image
FORFILES /p %TMP_DIR% /s /M *.changes /C "cmd /c move /Y @path %CD%\'; << self imageName; <<'.changes'.

	(self release asInteger >= 70) 
		ifTrue: [ self cr; << 'FORFILES /p %TMP_DIR% /s /M *.sources /C "cmd /c move /Y @path %CD%\@file"'.
].
	
	self << '
del /F /Q %TMP_DIR% 

echo '; << self imageName; <<'.image'; cr