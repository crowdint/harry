module Hogger
  module Routing
    class RouteCollection
      attr_accessor :routes

      def initialize
        self.routes = []
      end

      def draw(&block)
        yield self
      end

      def match(uri, options)
        self.routes << Route.new(uri, options)
      end

      def dispatch(env)
        path = env["REQUEST_PATH"]
        route = self.routes.select { |r| r.matches?(path) }.first
        if route
          route.controller.new(env).send(route.action)
        else
          raise RouteNotFoundException, "Route not found: #{path}"
        end
      end
    end
  end
end
