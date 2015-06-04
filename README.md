# Handlebars Plugin for [DocPad](https://docpad.org)

<!-- BADGES/ -->

[![Build Status](https://img.shields.io/travis/docpad/docpad-plugin-handlebars/master.svg)](http://travis-ci.org/docpad/docpad-plugin-handlebars "Check this project's build status on TravisCI")
[![NPM version](https://img.shields.io/npm/v/docpad-plugin-handlebars.svg)](https://npmjs.org/package/docpad-plugin-handlebars "View this project on NPM")
[![NPM downloads](https://img.shields.io/npm/dm/docpad-plugin-handlebars.svg)](https://npmjs.org/package/docpad-plugin-handlebars "View this project on NPM")
[![Dependency Status](https://img.shields.io/david/docpad/docpad-plugin-handlebars.svg)](https://david-dm.org/docpad/docpad-plugin-handlebars)
[![Dev Dependency Status](https://img.shields.io/david/dev/docpad/docpad-plugin-handlebars.svg)](https://david-dm.org/docpad/docpad-plugin-handlebars#info=devDependencies)<br/>
[![Gratipay donate button](https://img.shields.io/gratipay/docpad.svg)](https://www.gratipay.com/docpad/ "Donate weekly to this project using Gratipay")
[![Flattr donate button](https://img.shields.io/badge/flattr-donate-yellow.svg)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPal donate button](https://img.shields.io/badge/paypal-donate-yellow.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")
[![BitCoin donate button](https://img.shields.io/badge/bitcoin-donate-yellow.svg)](https://coinbase.com/checkouts/9ef59f5479eec1d97d63382c9ebcb93a "Donate once-off to this project using BitCoin")
[![Wishlist browse button](https://img.shields.io/badge/wishlist-donate-yellow.svg)](http://amzn.com/w/2F8TXKSNAFG4V "Buy an item on our wishlist for us")

<!-- /BADGES -->


Adds support for the [Handlebars](http://handlebarsjs.com/) templating engine to [DocPad](https://docpad.org)

Convention:  `.(inlinejs|js|anything).(handlebars|hbs|hb)`


## Install

``` bash
docpad install handlebars
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

[![Gratipay donate button](https://img.shields.io/gratipay/docpad.svg)](https://www.gratipay.com/docpad/ "Donate weekly to this project using Gratipay")
[![Flattr donate button](https://img.shields.io/badge/flattr-donate-yellow.svg)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPal donate button](https://img.shields.io/badge/paypal-donate-yellow.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")
[![BitCoin donate button](https://img.shields.io/badge/bitcoin-donate-yellow.svg)](https://coinbase.com/checkouts/9ef59f5479eec1d97d63382c9ebcb93a "Donate once-off to this project using BitCoin")
[![Wishlist browse button](https://img.shields.io/badge/wishlist-donate-yellow.svg)](http://amzn.com/w/2F8TXKSNAFG4V "Buy an item on our wishlist for us")

### Contributors

These amazing people have contributed code to this project:

- [Benjamin Lupton](https://github.com/balupton) <b@lupton.cc> — [view contributions](https://github.com/docpad/docpad-plugin-handlebars/commits?author=balupton)
- [Gilles Bouthenot](https://github.com/gbouthenot) — [view contributions](https://github.com/docpad/docpad-plugin-handlebars/commits?author=gbouthenot)
- [Mike Moulton](https://github.com/mmoulton) <mike@meltmedia.com> — [view contributions](https://github.com/docpad/docpad-plugin-handlebars/commits?author=mmoulton)
- [RobLoach](https://github.com/RobLoach) — [view contributions](https://github.com/docpad/docpad-plugin-handlebars/commits?author=RobLoach)
- [Tobias Birmili](https://github.com/toabi) <birmili@mecodia.de> — [view contributions](https://github.com/docpad/docpad-plugin-handlebars/commits?author=toabi)

[Become a contributor!](https://github.com/docpad/docpad-plugin-handlebars/blob/master/CONTRIBUTING.md#files)

<!-- /BACKERS -->


<!-- LICENSE/ -->

## License

Unless stated otherwise all works are:

- Copyright &copy; 2012+ Mike Moulton <mike@meltmedia.com> (http://meltmedia.com)

and licensed under:

- The incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT License](http://opensource.org/licenses/mit-license.php)

<!-- /LICENSE -->


