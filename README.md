# Handlebars Plugin for [DocPad](https://docpad.org)

<!-- BADGES/ -->

[![Build Status](http://img.shields.io/travis-ci/docpad/docpad-plugin-handlebars.png?branch=master)](http://travis-ci.org/docpad/docpad-plugin-handlebars "Check this project's build status on TravisCI")
[![NPM version](http://badge.fury.io/js/docpad-plugin-handlebars.png)](https://npmjs.org/package/docpad-plugin-handlebars "View this project on NPM")
[![Dependency Status](https://david-dm.org/docpad/docpad-plugin-handlebars.png?theme=shields.io)](https://david-dm.org/docpad/docpad-plugin-handlebars)
[![Development Dependency Status](https://david-dm.org/docpad/docpad-plugin-handlebars/dev-status.png?theme=shields.io)](https://david-dm.org/docpad/docpad-plugin-handlebars#info=devDependencies)<br/>
[![Gittip donate button](http://img.shields.io/gittip/docpad.png)](https://www.gittip.com/docpad/ "Donate weekly to this project using Gittip")
[![Flattr donate button](http://img.shields.io/flattr/donate.png?color=yellow)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](http://img.shields.io/paypal/donate.png?color=yellow)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")
[![BitCoin donate button](http://img.shields.io/bitcoin/donate.png?color=yellow)](https://coinbase.com/checkouts/9ef59f5479eec1d97d63382c9ebcb93a "Donate once-off to this project using BitCoin")

<!-- /BADGES -->


Adds support for the [Handlebars](http://handlebarsjs.com/) templating engine to [DocPad](https://docpad.org)

Convention:  `.(inlinejs|js|anything).(handlebars|hbs|hb)`


## Install

```
npm install --save docpad-plugin-handlebars
```


## Configuration

### Getting helpers and partials to work

For the plugin to support helpers and partials, you'll have to add something like the following to your [docpad configuration file](http://docpad.org/docs/config) manually:

``` coffee
# ...
plugins:
	handlebars:
		helpers:
			# Expose docpads 'getBlock' function to handlebars
			getBlock: (type, additional...) ->
				additional.pop() # remove the hash object
				@getBlock(type).add(additional).toHTML()
		partials:
			title: '<h1>{{document.title}}</h1>'
			goUp: '<a href="#">Scroll up</a>'
# ...
```


## Usage as precompiler

If the document extension is `.(inlinejs|js).(handlebars|hbs|hb)`, the plugin will produce a precompiled template. In this case, you can customise the precompiled template via the following:

``` coffee
# ...
plugins:
	handlebars:
		precompileOpts:
			wrapper: "default"
# ...
```

Available values for the wrapper option are:

- `"default"`: Produces a handlebars wrapper like:
	``` javascript
	(function() {
		var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
		templates['theSlugOfTheFile'] = template(function (Handlebars,depth0,helpers,partials,data) {
			...
		})
	})();
	```

- `"amd"`: Produces a AMD handlebars wrapper like:
	``` javascript
	define(['handlebars'], function(Handlebars) {
		var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
		templates['theSlugOfTheFile'] = template(function (Handlebars,depth0,helpers,partials,data) {
			...
		});
	});
	```

- `"none"`:  Produces a basic wrapper like:
	``` javascript
	function (Handlebars,depth0,helpers,partials,data) {
		...
	}
	```


<!-- HISTORY/ -->

## History
[Discover the change history by heading on over to the `HISTORY.md` file.](https://github.com/docpad/docpad-plugin-handlebars/blob/master/HISTORY.md#files)

<!-- /HISTORY -->


<!-- CONTRIBUTE/ -->

## Contribute

[Discover how you can contribute by heading on over to the `CONTRIBUTING.md` file.](https://github.com/docpad/docpad-plugin-handlebars/blob/master/CONTRIBUTING.md#files)

<!-- /CONTRIBUTE -->


<!-- BACKERS/ -->

## Backers

### Maintainers

These amazing people are maintaining this project:

- Mike Moulton <mike@meltmedia.com> (https://github.com/mmoulton)
- Benjamin Lupton <b@lupton.cc> (https://github.com/balupton)

### Sponsors

No sponsors yet! Will you be the first?

[![Gittip donate button](http://img.shields.io/gittip/docpad.png)](https://www.gittip.com/docpad/ "Donate weekly to this project using Gittip")
[![Flattr donate button](http://img.shields.io/flattr/donate.png?color=yellow)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](http://img.shields.io/paypal/donate.png?color=yellow)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")
[![BitCoin donate button](http://img.shields.io/bitcoin/donate.png?color=yellow)](https://coinbase.com/checkouts/9ef59f5479eec1d97d63382c9ebcb93a "Donate once-off to this project using BitCoin")

### Contributors

These amazing people have contributed code to this project:

- [Benjamin Lupton](https://github.com/balupton) <b@lupton.cc> — [view contributions](https://github.com/docpad/docpad-plugin-handlebars/commits?author=balupton)
- [Gilles Bouthenot](https://github.com/gbouthenot) — [view contributions](https://github.com/docpad/docpad-plugin-handlebars/commits?author=gbouthenot)
- [Mike Moulton](https://github.com/mmoulton) <mike@meltmedia.com> — [view contributions](https://github.com/docpad/docpad-plugin-handlebars/commits?author=mmoulton)
- [Tobias Birmili](https://github.com/toabi) <birmili@mecodia.de> — [view contributions](https://github.com/docpad/docpad-plugin-handlebars/commits?author=toabi)

[Become a contributor!](https://github.com/docpad/docpad-plugin-handlebars/blob/master/CONTRIBUTING.md#files)

<!-- /BACKERS -->


<!-- LICENSE/ -->

## License

Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT license](http://creativecommons.org/licenses/MIT/)

Copyright &copy; 2012+ Mike Moulton <mike@meltmedia.com> (http://meltmedia.com)

<!-- /LICENSE -->


