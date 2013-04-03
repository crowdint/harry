module Hogger
  class Controller
    attr_accessor :params
    attr_accessor :env

    def initialize(env)
      self.env = env
      parse_parameters
    end

    def parse_parameters
      self.params = Rack::Utils.parse_nested_query(env["QUERY_STRING"])
    end

    def render(view_path, locals = {})
      template = read_template(view_path)
      Haml::Engine.new(template).render(Object.new, locals)
    end

    def read_template(view_path)
      File.new(view_path).read
    end
  end
end
