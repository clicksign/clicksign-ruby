module Clicksign
  class Document < Base
    def self.all
      request :get,
        api_url('documents'),
        {}
    end

    def self.find(key)
      request :get,
        api_url('documents', key),
        {}
    end

    def self.create(file)
      request :post,
        api_url('documents'),
        { "document[archive][original]" => file },
        {}
    end

    def self.create_list(key, signers, skip_email = true)
      request :post,
        api_url('documents', key, 'list'),
        { signers: Array.wrap(signers), skip_email: skip_email }.to_json,
        content_type: "json"
    end
  end
end
