duckduckgo - Simple sitesearch using DuckDuckGo.com
===================================

duckduckgo is a very simple app that allows you to redirect a path 
(by default /_search/) to a query to duckduckgo.com restricted to 
your site.

Currently, to change that path requires editing the app.  In the
future, the path will be a configuration option.

Configuration
-------------

First, create the search path and the _werc directory under it:

	mkdir -p /www/werc/sites/MYSITE/_search/_werc/

Then, enable the duckduckgo app in that directory:

	echo 'conf_enable_duckduckgo' > /www/werc/sites/MYSITE/_search/_werc/config

Next, deploy the search form somewhere on your site.  This example puts
it in your footer:

	mkdir -p /www/werc/sites/MYSITE/_werc/lib/
	cp /www/werc/apps/search/footer.inc.sample /www/werc/sites/MYSITE/_werc/lib/footer.inc

Demo
----

For a demo of this app, see the footer of your favorite cat-v.org site.

TODO
----

* Make the search path a configuration option
* Provide a template for non-footer deployment
* Enable the search path itself to serve a search form to GET requests

