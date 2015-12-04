require 'rest-client'

module Clicksign
  class Client
    attr_accessor :config

    def authenticated?
      true
    end

    private
    def server
      RestClient::Resource.new(config.endpoint, access_token: config.access_token)
    end
  end
end
