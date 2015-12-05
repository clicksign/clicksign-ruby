module Clicksign
  class Config
    attr_accessor :access_token, :endpoint

    def self.setup(&block)
      new.tap(&block)
    end

    def self.default
      @default ||= new
    end
  end
end
