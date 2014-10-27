require 'rest_client'
require 'json/ext'

require 'clicksign/version'
require 'clicksign/base'
require 'clicksign/document'
require 'clicksign/batch'
require 'clicksign/hook'

module Clicksign
  class << self
    attr_accessor :endpoint, :token, :api_version
  end

  def self.configure(&block)
    self.endpoint    = 'https://api.clicksign.com'
    self.api_version = 'v1'

    yield self
  end
end
