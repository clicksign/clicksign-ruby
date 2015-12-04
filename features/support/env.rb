require 'coveralls'
require 'clicksign'

Coveralls.wear!

Clicksign.configure do |config|
  config.endpoint = ENV['ENDPOINT']
end
