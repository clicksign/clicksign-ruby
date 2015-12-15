module Clicksign
  class Command
    attr_accessor :resource

    def initialize(resource)
      @resource = resource
    end

    def get(extras = {})
      resource.get(extras)
    end
  end
end
