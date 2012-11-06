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
			{inExtension,templateData,content} = opts
			handlebars = @handlebars

			if inExtension in ['hb', 'hbs', 'handlebars']
				opts.content = handlebars.compile(opts.content)(templateData)
