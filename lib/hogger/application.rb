module Hogger
  class Application
    def self.routes
      @@routes ||= Hogger::Routing::RouteCollection.new
    end

    def self.routes=(value)
      @@routes = value
    end

    def initialize
      self.class.routes ||= Hogger::Routing::RouteCollection.new
    end

    def call(env)
      body    = self.class.routes.dispatch(env)
      headers = { "Content-Length" => body.length.to_s }
      [200, headers, [body]]
    end
  end
end
