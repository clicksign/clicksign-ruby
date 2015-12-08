module Clicksign
  class Config
    attr_accessor :access_token, :endpoint

    def self.default
      @default ||= new
    end

    def copy(&block)
      block_given? ? dup.tap(&block) : dup
    end
  end
end
