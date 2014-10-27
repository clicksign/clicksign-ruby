module Clicksign
  class Base
    def self.accept_header
      { accept: 'json' }
    end

    def self.request(method, *params)
      params.last.merge! accept_header
      parse RestClient.public_send(method, *params)
    end

    def self.api_url(*path)
      ([Clicksign.endpoint, Clicksign.api_version] + path).join("/") +
        "?access_token=#{Clicksign.token}"
    end

    def self.parse(response)
      response = {} if response.empty?
      JSON[response]
    end
  end
end
