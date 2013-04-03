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
  end
end
