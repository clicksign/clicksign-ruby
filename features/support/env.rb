require 'byebug'
require 'coveralls'
require 'clicksign'


Coveralls.wear!

Before do
  Clicksign.configure do |config|
    config.endpoint = 'http://example.com'
    config.access_token = 'token'
  end

  @client = Clicksign.client
end
