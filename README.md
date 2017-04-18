# Handlebars Plugin for [DocPad](https://docpad.org)

<!-- BADGES/ -->

<span class="badge-travisci"><a href="http://travis-ci.org/docpad/docpad-plugin-handlebars" title="Check this project's build status on TravisCI"><img src="https://img.shields.io/travis/docpad/docpad-plugin-handlebars/master.svg" alt="Travis CI Build Status" /></a></span>
<span class="badge-npmversion"><a href="https://npmjs.org/package/docpad-plugin-handlebars" title="View this project on NPM"><img src="https://img.shields.io/npm/v/docpad-plugin-handlebars.svg" alt="NPM version" /></a></span>
<span class="badge-npmdownloads"><a href="https://npmjs.org/package/docpad-plugin-handlebars" title="View this project on NPM"><img src="https://img.shields.io/npm/dm/docpad-plugin-handlebars.svg" alt="NPM downloads" /></a></span>
<span class="badge-daviddm"><a href="https://david-dm.org/docpad/docpad-plugin-handlebars" title="View the status of this project's dependencies on DavidDM"><img src="https://img.shields.io/david/docpad/docpad-plugin-handlebars.svg" alt="Dependency Status" /></a></span>
<span class="badge-daviddmdev"><a href="https://david-dm.org/docpad/docpad-plugin-handlebars#info=devDependencies" title="View the status of this project's development dependencies on DavidDM"><img src="https://img.shields.io/david/dev/docpad/docpad-plugin-handlebars.svg" alt="Dev Dependency Status" /></a></span>
<br class="badge-separator" />
<span class="badge-patreon"><a href="https://patreon.com/bevry" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a></span>
<span class="badge-opencollective"><a href="https://opencollective.com/bevry" title="Donate to this project using Open Collective"><img src="https://img.shields.io/badge/open%20collective-donate-yellow.svg" alt="Open Collective donate button" /></a></span>
<span class="badge-gratipay"><a href="https://www.gratipay.com/bevry" title="Donate weekly to this project using Gratipay"><img src="https://img.shields.io/badge/gratipay-donate-yellow.svg" alt="Gratipay donate button" /></a></span>
<span class="badge-flattr"><a href="https://flattr.com/profile/balupton" title="Donate to this project using Flattr"><img src="https://img.shields.io/badge/flattr-donate-yellow.svg" alt="Flattr donate button" /></a></span>
<span class="badge-paypal"><a href="https://bevry.me/paypal" title="Donate to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal donate button" /></a></span>
<span class="badge-bitcoin"><a href="https://bevry.me/bitcoin" title="Donate once-off to this project using Bitcoin"><img src="https://img.shields.io/badge/bitcoin-donate-yellow.svg" alt="Bitcoin donate button" /></a></span>
<span class="badge-wishlist"><a href="https://bevry.me/wishlist" title="Buy an item on our wishlist for us"><img src="https://img.shields.io/badge/wishlist-donate-yellow.svg" alt="Wishlist browse button" /></a></span>
<br class="badge-separator" />
<span class="badge-slackin"><a href="https://slack.bevry.me" title="Join this project's slack community"><img src="https://slack.bevry.me/badge.svg" alt="Slack community badge" /></a></span>

<!-- /BADGES -->


Adds support for the [Handlebars](http://handlebarsjs.com/) templating engine to [DocPad](https://docpad.org)

Convention:  `.(inlinejs|js|anything).(handlebars|hbs|hb)`


<!-- INSTALL/ -->

<h2>Install</h2>

Install this DocPad plugin by entering <code>docpad install handlebars</code> into your terminal.

<!-- /INSTALL -->


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

In your handlebars template you will need to use {{{content}}} to prevent handlebars from escaping any html content. You also cannot use helper functions as a parameter to {{#each collection}}, instead you should define a templateData variable and map the name to a @getCollection call e:g:
```
    sitePages: ->
      @getCollection("pages").toJSON()
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

<h2>History</h2>

<a href="https://github.com/docpad/docpad-plugin-handlebars/blob/master/HISTORY.md#files">Discover the release history by heading on over to the <code>HISTORY.md</code> file.</a>

<!-- /HISTORY -->


<!-- CONTRIBUTE/ -->

<h2>Contribute</h2>

<a href="https://github.com/docpad/docpad-plugin-handlebars/blob/master/CONTRIBUTING.md#files">Discover how you can contribute by heading on over to the <code>CONTRIBUTING.md</code> file.</a>

<!-- /CONTRIBUTE -->


<!-- BACKERS/ -->

<h2>Backers</h2>

<h3>Maintainers</h3>

These amazing people are maintaining this project:

<ul><li><a href="http://meltmedia.com">Mike Moulton</a> — <a href="https://github.com/docpad/docpad-plugin-handlebars/commits?author=mmoulton" title="View the GitHub contributions of Mike Moulton on repository docpad/docpad-plugin-handlebars">view contributions</a></li>
<li><a href="http://balupton.com">Benjamin Lupton</a> — <a href="https://github.com/docpad/docpad-plugin-handlebars/commits?author=balupton" title="View the GitHub contributions of Benjamin Lupton on repository docpad/docpad-plugin-handlebars">view contributions</a></li></ul>

<h3>Sponsors</h3>

No sponsors yet! Will you be the first?

<span class="badge-patreon"><a href="https://patreon.com/bevry" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a></span>
<span class="badge-opencollective"><a href="https://opencollective.com/bevry" title="Donate to this project using Open Collective"><img src="https://img.shields.io/badge/open%20collective-donate-yellow.svg" alt="Open Collective donate button" /></a></span>
<span class="badge-gratipay"><a href="https://www.gratipay.com/bevry" title="Donate weekly to this project using Gratipay"><img src="https://img.shields.io/badge/gratipay-donate-yellow.svg" alt="Gratipay donate button" /></a></span>
<span class="badge-flattr"><a href="https://flattr.com/profile/balupton" title="Donate to this project using Flattr"><img src="https://img.shields.io/badge/flattr-donate-yellow.svg" alt="Flattr donate button" /></a></span>
<span class="badge-paypal"><a href="https://bevry.me/paypal" title="Donate to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal donate button" /></a></span>
<span class="badge-bitcoin"><a href="https://bevry.me/bitcoin" title="Donate once-off to this project using Bitcoin"><img src="https://img.shields.io/badge/bitcoin-donate-yellow.svg" alt="Bitcoin donate button" /></a></span>
<span class="badge-wishlist"><a href="https://bevry.me/wishlist" title="Buy an item on our wishlist for us"><img src="https://img.shields.io/badge/wishlist-donate-yellow.svg" alt="Wishlist browse button" /></a></span>

<h3>Contributors</h3>

These amazing people have contributed code to this project:

<ul><li><a href="http://meltmedia.com">Mike Moulton</a> — <a href="https://github.com/docpad/docpad-plugin-handlebars/commits?author=mmoulton" title="View the GitHub contributions of Mike Moulton on repository docpad/docpad-plugin-handlebars">view contributions</a></li>
<li><a href="http://balupton.com">Benjamin Lupton</a> — <a href="https://github.com/docpad/docpad-plugin-handlebars/commits?author=balupton" title="View the GitHub contributions of Benjamin Lupton on repository docpad/docpad-plugin-handlebars">view contributions</a></li>
<li><a href="https://github.com/gbouthenot">Gilles Bouthenot</a> — <a href="https://github.com/docpad/docpad-plugin-handlebars/commits?author=gbouthenot" title="View the GitHub contributions of Gilles Bouthenot on repository docpad/docpad-plugin-handlebars">view contributions</a></li>
<li><a href="http://robloach.net">Rob Loach</a> — <a href="https://github.com/docpad/docpad-plugin-handlebars/commits?author=RobLoach" title="View the GitHub contributions of Rob Loach on repository docpad/docpad-plugin-handlebars">view contributions</a></li>
<li><a href="https://github.com/toabi">Tobias Birmili</a> — <a href="https://github.com/docpad/docpad-plugin-handlebars/commits?author=toabi" title="View the GitHub contributions of Tobias Birmili on repository docpad/docpad-plugin-handlebars">view contributions</a></li>
<li><a href="https://github.com/macta">Tim Mackinnon</a> — <a href="https://github.com/docpad/docpad-plugin-handlebars/commits?author=macta" title="View the GitHub contributions of Tim Mackinnon on repository docpad/docpad-plugin-handlebars">view contributions</a></li>
<li><a href="https://github.com/vsopvsop">vsopvsop</a> — <a href="https://github.com/docpad/docpad-plugin-handlebars/commits?author=vsopvsop" title="View the GitHub contributions of vsopvsop on repository docpad/docpad-plugin-handlebars">view contributions</a></li></ul>

<a href="https://github.com/docpad/docpad-plugin-handlebars/blob/master/CONTRIBUTING.md#files">Discover how you can contribute by heading on over to the <code>CONTRIBUTING.md</code> file.</a>

<!-- /BACKERS -->


<!-- LICENSE/ -->

<h2>License</h2>

Unless stated otherwise all works are:

<ul><li>Copyright &copy; 2012+ <a href="http://meltmedia.com">Mike Moulton</a></li></ul>

and licensed under:

<ul><li><a href="http://spdx.org/licenses/MIT.html">MIT License</a></li></ul>

<!-- /LICENSE -->
