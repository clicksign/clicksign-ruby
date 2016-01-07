require 'ostruct'

module Clicksign
  class Document
    attr_accessor :key, :name, :status, :created_at, :started_at, :canceled_at,
                  :user_key, :signers, :client, :params

    def self.parse(client, json)
      new.tap do |document|
        document.client = client
        document.parse(json)
      end
    end

    def create
      parse client['documents'].post(params)[:document]
    end

    def cancel!
      parse client['documents'][key]['cancel'].post(nil)[:document]
    end

    def resend(email)
      client['documents'][key]['resend'].post(email: email)
    rescue RestClient::Exception
      false
    else
      true
    end

    def download(wait = 5)
      Timeout.timeout(wait) do
        loop do
          client['documents'][key]['download'].get do |response|

            case response.code
            when 200
              return response
            when 201
              sleep 1
            else
              raise RestClient::Exception.new \
                "Unexpected response: #{response.code}"
            end
          end
        end
      end
    end

    def parse(attributes = {})
      [:key, :status, :created_at].each do |attr|
        self.send("#{attr}=", attributes[attr])
      end

      self.name = attributes[:original_name]

      if (list = attributes[:list])
        self.user_key = list[:user_key]
        self.started_at = list[:started_at]
        self.canceled_at = list[:canceled_at]

        signatures = list[:signatures] || []
        signatures.each do |signature|
          (self.signers ||= []).push(OpenStruct.new(signature))
        end
      end

      self
    end
  end
end
