require 'rest-client'

require 'clicksign/command/whoami'
require 'clicksign/command/document'

module Clicksign
  class Client
    include Command::Whoami
    include Command::Document

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

    private
    def driver
      RestClient::Resource.new(endpoint)
    end

    def get(path)
      driver[path].get(params: { access_token: access_token })
    end
  end
end
