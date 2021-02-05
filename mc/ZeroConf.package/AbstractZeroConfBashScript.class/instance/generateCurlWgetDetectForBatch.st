script generation
generateCurlWgetDetectForBatch
	self 
		<< 'rem  try to use curl if possible'; cr;
		<< 'rem  try to use curl if possible
where curl 2> NUL
if  ERRORLEVEL 0 (
	SET "DOWNLOAD=curl  --location "
	SET "DOWNLOAD_TO=!DOWNLOAD! --output "
) else (
	where wget 2> NUL
	if ERRORLEVEL 0 (
	SET "DOWNLOAD_TO=wget --quiet --output-document="
	SET "DOWNLOAD=!DOWNLOAD_TO-!"
	) else (
	echo "Please install curl or wget on your machine"
	exit 1)
)'; cr