require 'clicksign/version'
require 'clicksign/config'
require 'clicksign/client'

module Clicksign
  def self.configure(&block)
    Config.setup(&block)
  end

  def self.config
    Config.instance
  end

  def self.client
    Client.new.tap do |client|
      client.config = config
    end
  end
end
