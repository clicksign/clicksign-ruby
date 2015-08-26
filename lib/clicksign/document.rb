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

    def self.create(file, params = {})
      signers = params.delete(:signers)
      params['signers[]'] = [signers].flatten(1) if signers

      request :post,
        api_url('documents'),
        { "document[archive][original]" => file }.merge(params),
        {}
    end

    def self.create_list(key, signers, skip_email = true)
      request :post,
        api_url('documents', key, 'list'),
        { signers: [signers].flatten(1), skip_email: skip_email }.to_json,
        content_type: 'json'
    end

    def self.resend(key, email, message)
      request :post,
        api_url('documents', key, 'resend'),
        { email: email, message: message }.to_json,
        content_type: 'json'
    end

    def self.download(key)
      RestClient.get(api_url('documents', key, 'download')) do |response, request, result, &block|
        case response.code
        when 200
          response
        when 202
          nil
        else
          response.return!(request, response, &block)
        end
      end
    end
  end
end
