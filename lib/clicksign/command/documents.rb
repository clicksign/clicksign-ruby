require 'clicksign/command'
require 'clicksign/document'
require 'clicksign/hook'

module Clicksign::Command::Documents
  def documents
    Collection.new(self)
  end

  class Collection
    include Enumerable
    alias all to_a
    private :to_a

    def initialize(client)
      @client = client
    end

    def each(&block)
      @client['documents'].get.map do |json|
        build(json[:document])
      end.each(&block)
    end

    def create(file: nil, signers: [], message: nil, skip_email: true)
      params = {}

      params['document[archive][original]'] = file

      signers.each do |email, act|
        params['signers[]'] ||= []
        params['signers[]'].push({email: email, act: act})
      end

      params['message'] = message
      params['skip_email'] = skip_email

      build @client['documents'].post(params)
    end

    def find(key)
      build @client['documents'][key].get[:document]
    rescue RestClient::InternalServerError
      nil
    end

    private
    def build(json)
      Clicksign::Document.parse(@client, json)
    end
  end
end
