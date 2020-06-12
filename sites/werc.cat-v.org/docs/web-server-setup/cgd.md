cgd
===

Cgd is a simple daemon written in [go](http://golang.org) that can
serve a CGI script over HTTP or FastCGI.  It only needs to know the
location of the Plan 9 (9base, frontbase, or plan9port) binaries, and
the location of the werc installation itself.  There is no
configuration file.

For example, to run werc under cgd on Plan 9:

	PLAN9=/ cgd -c $werc/bin/werc.rc -w $werc/bin

Download it here: <https://code.9front.org/hg/cgd>
