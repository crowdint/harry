module Hogger
  module Routing
    class Route
      attr_accessor :path, :controller, :action

      def initialize(path, options)
        self.path        = path
        self.controller = options[:controller]
        self.action     = options[:action]
      end

      def matches?(path)
        self.path == path
      end
    end
  end
end
