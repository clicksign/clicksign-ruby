require 'rest-client'

module Clicksign
  class Client
    attr_accessor :config

    def self.setup(&block)
      new.tap(&block)
    end

    def access_token
      config.access_token
    end

    def endpoint
      config.endpoint
    end

    def authenticated?
      begin
        resource['v1/whoami'].get(params: { access_token: access_token })
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
