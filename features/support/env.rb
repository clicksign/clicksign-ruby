require 'byebug'
require 'coveralls'
require 'clicksign'

Coveralls.wear!

Before do
  Clicksign.configure do |config|
    config.endpoint = ENV['ENDPOINT']
    config.access_token = ENV['ACCESS_TOKEN']
  end

  @client = Clicksign.client
end
