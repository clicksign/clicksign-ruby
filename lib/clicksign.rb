require 'clicksign/version'
require 'clicksign/config'
require 'clicksign/client'

module Clicksign
  def self.configure(&block)
    yield(config) if block_given?
  end

  def self.client(config = Config.default, &block)
    Client.setup do |client|
      if block_given?
        client.config = Config.setup(&block)
      else
        client.config = config
      end
    end
  end

  def self.config
    Config.default
  end
end
