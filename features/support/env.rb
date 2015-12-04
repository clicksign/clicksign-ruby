require 'clicksign'

Clicksign.configure do |config|
  config.endpoint = ENV['ENDPOINT']
end
