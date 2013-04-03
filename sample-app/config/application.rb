require "hogger"
require "app/controllers/hello_controller"

class HoggerApp < Hogger::Application
end

load "config/routes.rb"
