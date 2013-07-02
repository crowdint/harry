require "bundler"

Bundler.require

#
# Load all controller files
#
Dir[File.join(File.expand_path("../../app/controllers", __FILE__), "*.rb")].each { |f| load f }

#
# Define the application
#
module HarryApp
  class Application < Harry::Application ; end
end

#
# Generic Setup of the application
#
HarryApp::Application.setup!
