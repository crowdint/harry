module Harry
  module Assets
    extend self

    require 'harry/assets/configuration'
    require 'harry/assets/middleware'

    def self.configure &block
      block.call(config)
    end

    def self.config
      @@config ||= Configuration.new
    end
  end
end
