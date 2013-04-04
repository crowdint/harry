module Muggle
  module Assets
    class Configuration
      attr_reader :load_paths

      def initialize
        @load_paths ||= []
      end

      def append_path path
        @load_paths << path
      end
    end
  end
end
