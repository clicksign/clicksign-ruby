module Clicksign
  class Batch < Base
    def self.all
      request :get,
        api_url('batches'),
        {}
    end

    def self.create(keys)
      raise ArgumentError, "keys need to be an array" unless keys.is_a? Array

      request :post,
        api_url('batches'),
        { keys: keys },
        {}
    end

    def self.delete(id)
      request :delete,
        api_url('batches', id),
        {}
    end
  end
end
