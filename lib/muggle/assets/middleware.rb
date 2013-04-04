module Muggle
  module Assets
    class Middleware
      attr_reader :environment, :app

      def initialize app
        @app         = app
        @environment = create_assets_env
      end

      def call(env)
        path = env['PATH_INFO']
        if path.match /\/assets/
          env['PATH_INFO'].sub!('/assets', '')
          @environment.call(env)
        else
          @app.call(env)
        end
      end

      private

      def create_assets_env
        env = Sprockets::Environment.new
        Assets.config.load_paths.each do |path|
          env.append_path path
        end
        env
      end
    end
  end
end
