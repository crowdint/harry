module Hogger
  module Assets
    extend self

    require 'hogger/assets/configuration'
    require 'hogger/assets/middleware'

    def self.configure &block
      block.call(config)
    end

    def self.config
      @@config ||= Configuration.new
    end
  end
end
