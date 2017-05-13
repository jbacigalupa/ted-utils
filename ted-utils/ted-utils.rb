require 'sketchup.rb'
extension = SketchupExtension.new( "TedUtils", "ted-utils/ted-utils.rb")

extension.description = "Various tools and helpers"
extension.version = "0.1"
extension.creator = "Joe Bacigalupa"
extension.copyright = "2017, Joe Bacigalupa"

# Register the extension with Sketchup.
Sketchup.register_extension extension, true