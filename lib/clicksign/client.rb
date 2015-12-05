require 'rest-client'

module Clicksign
  class Client
    attr_accessor :config

    def authenticated?
      begin
        resource['v1/whoami'].get(params: { access_token: config.access_token })
      rescue RestClient::Unauthorized
        false
      end
    end

    private
    def resource
      RestClient::Resource.new(config.endpoint)
    end
  end
end
