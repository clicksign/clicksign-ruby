require 'ostruct'

module Clicksign
  class Document
    attr_accessor :key, :name, :status, :created_at, :started_at, :canceled_at,
                  :user_key, :signers, :client, :params

    def self.create(client, file: nil, signers: [], message: nil, skip_email: true)
      params = {}

      params['document[archive][original]'] = file

      signers.each do |email, act|
        params['signers[]'] ||= []
        params['signers[]'].push({email: email, act: act})
      end

      params['message'] = message
      params['skip_email'] = skip_email

      new.tap do |document|
        document.client = client
        document.params = params
        document.fetch!
      end
    end

    def self.parse(attributes = {})
      new.parse(attributes)
    end

    def fetch!
      parse client['documents'].post(params)[:document]
    end

    def cancel!
      parse client['documents'][key]['cancel'].post(nil)[:document]
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

    def download
      Timeout.timeout 5 do
        client['documents'][key]['download'].get do |response|
          case response.code
          when 200
            response
          when 201
            sleep 3
            download
          else
            raise response.description
          end
        end
      end
    end
  end
end
