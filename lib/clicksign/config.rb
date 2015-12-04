require 'singleton'

module Clicksign
  class Config
    include Singleton

    attr_accessor :access_token, :endpoint

    def self.configure
      yield(instance) if block_given?
    end
  end
end
