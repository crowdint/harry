module Render
  class Engine
    attr_accessor :template_path

    def initialize(template_path)
      self.template_path = template_path
    end

    def read_template
      read_template_with_path(self.template_path)
    end

    def read_template_with_path(template_path)
      File.new(template_path).read
    end
  end
end
