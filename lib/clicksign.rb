require 'rest_client'
require 'json/ext'
require 'active_support/core_ext'

require 'clicksign/version'
require 'clicksign/base'
require 'clicksign/document'
require 'clicksign/hook'

module Clicksign
  ENDPOINTS = {
    :demo       => 'api.clicksign-demo.com',
    :stage      => 'api.clicksign-stage.com',
    :production => 'api.clicksign.com',
  }

  class << self
    attr_accessor :env, :token, :secure, :format, :api_version
  end

  def self.configure(&block)
    self.env         = :demo
    self.secure      = true
    self.format      = 'json'
    self.api_version = 'v1'

    yield self
  end

  def self.endpoint
    "#{protocol}://#{ENDPOINTS[env]}"
  end

  def self.protocol
    secure ? "https" : "http"
  end
end
