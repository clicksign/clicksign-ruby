module Clicksign
  class Hook < Base
    def self.all(key)
      request :get,
        api_url('documents', key, 'hooks'),
        {}
    end

    def self.find(key, id)
      request :get,
        api_url('documents', key, 'hooks', id),
        {}
    end

    def self.create(key, url)
      request :post,
        api_url('documents', key, 'hooks'),
        { url: url }.to_json,
        { content_type: "json" }
    end

    def self.delete(key, id)
      request :delete,
        api_url('documents', key, 'hooks', id),
        {}
    end
  end
end
