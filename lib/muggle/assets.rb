module Hogger
  module Assets
    extend self

    require 'muggle/assets/configuration'
    require 'muggle/assets/middleware'

    def self.configure &block
      block.call(config)
    end

    def self.config
      @@config ||= Configuration.new
    end
  end
end
