module Hogger
  module Routing
    class Route
      attr_accessor :uri, :controller, :action

      def initialize(uri, options)
        self.uri        = uri
        self.controller = options[:controller]
        self.action     = options[:action]
      end

      def matches?(uri)
        self.uri == uri
      end
    end
  end
end
