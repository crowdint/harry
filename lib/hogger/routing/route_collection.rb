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

      def dispatch(uri)
        route = self.routes.select { |r| r.matches?(uri) }.first
        if route
          route.controller.new.send(route.action)
        else
          raise RouteNotFoundException, "Route not found: #{uri}"
        end
      end
    end
  end
end
