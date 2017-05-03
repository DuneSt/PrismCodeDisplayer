html-specific
protectToCRLF
	"this is a hack because Prism remove crlf and this create problem when:
	 - we want to tag something protected to crlf 
	 - when we display interval from regex matches in file in pharo side without the protect to CRLF"

	self flag: 'hack'.
	protectToCRLF := true