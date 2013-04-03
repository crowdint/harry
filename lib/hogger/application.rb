module Hogger
  class Application
    def self.routes
      @@routes ||= RouteCollection.new
    end

    def self.routes=(value)
      @@routes = value
    end

    def initialize
      self.class.routes ||= RouteCollection.new
    end

    def call(env)
      body    = self.class.routes.dispatch(env["REQUEST_PATH"])
      headers = { "Content-Length" => body.length.to_s }
      [200, headers, [body]]
    end
  end
end
