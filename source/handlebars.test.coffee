# Test our plugin using DocPad's Testers

require('docpad-plugintester').test({
 DocPad: require('docpad'),
 pluginPath: require('path').join(__dirname, '..')
})
