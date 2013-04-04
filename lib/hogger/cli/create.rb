require "erb"

module Hogger
  module CLI
    class Create
      attr_accessor :app_name
      attr_accessor :root_path

      FOLDERS = %w(app app/controllers app/views config app/assets app/assets/javascripts app/assets/stylesheets)
      FILES   = %w(config.ru config/application.rb config/routes.rb Gemfile)

      def initialize(app_name)
        self.app_name = app_name
        self.root_path = "."
      end

      def create_app_folder
        app_folder = File.join(self.root_path, app_name)
        Dir.mkdir app_folder unless Dir.exist?(app_folder)
      end

      def create_app_folder_structure
        create_app_folder
        FOLDERS.each do |f|
          folder = File.join(self.root_path, app_name, f)
          Dir.mkdir folder unless Dir.exist?(folder)
        end
      end

      def create_files
        create_app_folder_structure
        FILES.each do |f|
          template = File.new(template_path(f))
          app_name = self.app_name
          file = File.open(File.join(self.root_path, self.app_name, f), "w")
          puts "Creating #{file.path}"
          file.write ERB.new(template.read).result(binding)
        end
      end

      def template_path(template)
        File.join(File.expand_path("../", __FILE__), "templates", "#{template}.erb")
      end
    end
  end
end
