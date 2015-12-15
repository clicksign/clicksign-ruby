require 'clicksign/command'
require 'clicksign/document'

module Clicksign::Command::Documents
  def documents(reload = false)
    @documents = nil if reload
    @documents ||= Proxy.new.tap { |proxy| proxy.client = self }
  end

  class Proxy
    include Enumerable

    attr_accessor :client
    alias all to_a
    private :to_a

    def each(&block)
      (@cache ||= client['documents'].get).each(&block)
    end

    def create(params)
      Document.create(client, params)
    end

    def find(key)
      Document.new(client, key)
    end
  end
end
