module Clicksign
  class Base
    def self.accept_header
      { accept: Clicksign.format }
    end

    def self.request(method, *params)
      params.last.merge! accept_header
      parse RestClient.public_send(method, *params)
    end

    def self.api_url(*path)
      ([Clicksign.endpoint, Clicksign.api_version] + path).join("/") +
        "?access_token=#{Clicksign.token}"
    end

    def self.is_json?
      Clicksign.format == 'json'
    end

    def self.parse(response)
      if is_json?
        JSON[response]
      else
        Hash.from_xml(response)
      end
    end
  end
end
