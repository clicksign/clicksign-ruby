require 'byebug'
require 'coveralls'
require 'clicksign'

Coveralls.wear!

Clicksign.configure do |config|
  config.endpoint = ENV['ENDPOINT']
  config.access_token = ENV['ACCESS_TOKEN']
end
