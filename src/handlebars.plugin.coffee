fs = require('safefs')
wrench = require('wrench')
path = require('path')

module.exports = (BasePlugin) ->

	# Define Plugin
	class HandlebarsPlugin extends BasePlugin

		# Plugin name
		name: 'handlebars'

		# Handlebars
		handlebars: null

		# Constructor
		constructor: ->
			# Prepare
			super
			docpad = @docpad
			config = @config
			handlebars = @handlebars = require('handlebars')

			@precompileOpts = @config.precompileOpts || {}

			# Add helpers, if defined in docpad.cson
			if @config.helpers
				for own name,helper of @config.helpers
					handlebars.registerHelper(name, helper)

			# Add partials, if defined in docpad.cson
			if @config.partials
					for own name,partial of @config.partials
						handlebars.registerPartial(name, partial)

		# Render some content
		render: (opts) ->
			# Prepare
			{inExtension,outExtension,templateData,content} = opts
			handlebars = @handlebars

			if inExtension in ['hb', 'hbs', 'handlebars']
				if outExtension in ['js', 'inlinejs']
					output = @handlePrecompileOpts(opts)
				else
					output = handlebars.compile(opts.content)(templateData)
				opts.content = output

		handlePrecompileOpts: (opts) ->
			argv = @precompileOpts
			argv.wrapper ?= "default"
			argv.amdPath ?= ""

			pre = post = "";

			# slug for {src}/tpl/a/abc/test.js.handlebars is "tpl-a-abc-test"
			templateName = opts.file.attributes.slug;
			if (argv.wrapper is "amd")
				pre += 'define([\'' + argv.amdPath + 'handlebars\'], function(Handlebars) {\n'
			if (argv.wrapper is "default")
				pre += '(function() {\n'
			if (argv.wrapper in [ "default", "amd" ])
				pre += '  var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};\n'
				pre += 'templates[\'' + templateName + '\'] = template('
				post += ');\n'

			if (argv.wrapper is "amd")
				post += '});'
			if (argv.wrapper is "default")
				post += '})();'

			return pre + @handlebars.precompile(opts.content) + post

		generateBefore: (opts, next) ->
			partialsDir = @config.partialsDir
			handlebars = @handlebars
			docpad = @docpad
			if partialsDir
				wrench.readdirRecursive partialsDir, (err, files) ->
					return docpad.error(err) if err

					for fileName in files when fileName.match /(hb|hbs|handlebars)$/
						filePath = path.join(partialsDir, fileName).replace(path.sep, '/')
						partial = fs.readFileSync filePath, 'utf8'
						handlebars.registerPartial(fileName.split('.')[0], partial)
					next()
