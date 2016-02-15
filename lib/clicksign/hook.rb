module Clicksign
  class Hook
    attr_accessor :id, :url, :created_at, :updated_at
    attr_writer :client, :document

    def self.build(client, document, json)
      new.tap do |hook|
        hook.client = client
        hook.document = document
        hook.parse(json)
      end
    end

    def destroy
      @client['documents'][document.key]['hooks'][@id].delete
    end

    def parse(json)
      self.id = json[:id]
      self.url = json[:url]
      self.created_at = Time.parse(json[:created_at])
      self.updated_at = Time.parse(json[:created_at]) 
    end
  end
end
