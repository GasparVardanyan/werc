Custom CSS Stylesheets
=====================

If you create a file under your site's dir at _werc/pub/style.css it will be included automatically after the standard werc stylesheet.

You can copy pub/style/style.css and customize it, or you can take a simpler file and just change the main color theme.

Here is an example of how to set the main werc colors:


	header nav { background-color: rgb(100,135,220); color: white; }
	header h1 { background-color: #ff6d06; color: black; }
	body > nav > div { border-bottom: 1px solid #ddd; } 
	body > nav > div a { color: rgb(0, 102, 204); } 
	body > nav > div a:hover { color: white; background-color: rgb(100,135,220); }
