require 'ostruct'

module Clicksign
  class Document
    attr_accessor :key, :name, :status, :created_at, :started_at, :user_key, :signers

    def self.create(client, file: nil, signers: [], message: nil, skip_email: true)
      body = {}

      body['document[archive][original]'] = file

      signers.each do |email, act|
        body['signers[]'] ||= []
        body['signers[]'].push({email: email, act: act})
      end

      body['message'] = message
      body['skip_email'] = skip_email

      build client['documents'].post(body)[:document]
    end

    def self.build(attributes = {})
      new.parse(attributes)
    end

    def parse(attributes = {})
      [:key, :status, :created_at].each do |attr|
        self.send("#{attr}=", attributes[attr])
      end

      self.name = attributes[:original_name]

      if (list = attributes[:list])
        self.user_key = list[:user_key]
        self.started_at = list[:started_at]

        signatures = list[:signatures] || []
        signatures.each do |signature|
          (self.signers ||= []).push(OpenStruct.new(signature))
        end
      end

      self
    end
  end
end
