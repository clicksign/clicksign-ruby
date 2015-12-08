require 'clicksign/version'
require 'clicksign/config'
require 'clicksign/client'

module Clicksign
  def self.configure(&block)
    yield(config) if block_given?
  end

  def self.client(config = Config.default, &block)
    Client.setup { |client| client.config = config.copy(&block) }
  end

  def self.config
    Config.default
  end
end
