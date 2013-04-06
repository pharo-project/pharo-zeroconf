accessing
url
	"Return the URL of the location of this script"
	^ url ifNil: [ self baseUrl / self basename ]