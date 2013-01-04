# Handlebars Plugin for DocPad
Adds support for the [Handlebars](http://handlebarsjs.com/) templating engine to [DocPad](https://docpad.org)

Convention:  `.inlinejs|js|anything.handlebars|hbs|hb`


## Install

```
npm install --save docpad-plugin-handlebars
```


## Usage

The plugin also supports helpers and partials. They can be defined in the docpad settings.

Here is a small example:

    {
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
    }


## Usage as precompiler

If the document extension is `.inlinejs|js.handlebars|hbs|hb`, the plugin will produce a precompiled template.
In that, case, you can customise the ouput in the docpad settings:

    {
        precompileOpts:
            wrapper: "default"
                # wrapper should be "default", "amd" or "none" (please note that "none" is probably not what you want
                # "none": This option produces non-uglifable, so use "*.inlinejs.handlebars" extension
                #     function (Handlebars,depth0,helpers,partials,data) {
                #         ...
                #     }
                # "default" :
                #     (function() {
                #         var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
                #         templates['test'] = template(function (Handlebars,depth0,helpers,partials,data) {
                #             ...
                #         })
                #     })();
                # "amd":
                #     define(['handlebars'], function(Handlebars) {
                #         var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
                #         templates['test'] = template(function (Handlebars,depth0,helpers,partials,data) {
                #             ...
                #         });
                #     });
    }


## History

You can discover the history inside the `History.md` file


## License
Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT License](http://creativecommons.org/licenses/MIT/)
<br/>Copyright &copy; 2012 [Mike Moulton](http://meltmedia.com)