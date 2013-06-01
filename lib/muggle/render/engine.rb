module Render
  class Engine
    attr_accessor :template_path

    def initialize(template_path)
      self.template_path = template_path
    end

    def read_template
      File.new(self.template_path).read
    end
  end
end
