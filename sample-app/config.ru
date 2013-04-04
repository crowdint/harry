$: << "."
$: << "lib"

ENV['MUGGLE_ROOT'] = File.expand_path(File.dirname(__FILE__))

load "config/application.rb"

run MuggleApp::Application.new
