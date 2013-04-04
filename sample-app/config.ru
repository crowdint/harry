$: << "."
$: << "lib"

ENV['HOGGER_ROOT'] = __dir__

load "config/application.rb"

run HoggerApp::Application.new
