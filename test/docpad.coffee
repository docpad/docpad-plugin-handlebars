module.exports =
	plugins:
		handlebars:
			helpers:
				helperTest: () ->
					output = "Testing Helpers"
			partials:
				partial1: '<h1>{{document.example}}</h1>'
				partial2: '<a href="#">Scroll up</a>'