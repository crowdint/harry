module Hogger
  class Application
    class << self
      attr_accessor :root_path
    end

    def self.routes
      @@routes ||= Hogger::Routing::RouteCollection.new
    end

    def self.routes=(value)
      @@routes = value
    end

    def self.setup!
      Hogger::Application.root_path = ENV['HOGGER_ROOT']
    end

    def call(env)
      body    = self.class.routes.dispatch(env)
      headers = { "Content-Length" => body.length.to_s }
      [200, headers, [body]]
    end
  end
end
