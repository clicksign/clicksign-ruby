require 'json'
require 'rest-client'
require 'clicksign/command/whoami'
require 'clicksign/command/documents'

module Clicksign
  class Client
    include Command::Whoami
    include Command::Documents

    attr_accessor :config

    def access_token
      config.access_token
    end

    def endpoint
      config.endpoint
    end

    def [](path = '/')
      resource[path, &parse]
    end

    private
    def resource
      RestClient::Resource.new(endpoint, headers)
    end

    def headers
      { headers: {
        accept: 'application/json',
        params: { access_token: access_token }}}
    end

    def parse
      lambda do |resp, req, res|
        case res.code
        when /2\d\d/
          JSON.parse(resp, symbolize_names: true)
        else
          resp.return!
        end
      end
    end
  end
end
