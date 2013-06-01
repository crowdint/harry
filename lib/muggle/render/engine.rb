module Render
  class Engine
    attr_accessor :template_path

    def self.engine
      @engine
    end

    def self.engine=(engine)
      @engine = engine
    end

    def initialize(template_path)
      self.template_path = template_path
    end

    def read_template
      File.new(self.template_path).read
    end

  end
end
