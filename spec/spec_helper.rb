$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'clicksign'
require 'byebug'
require 'webmock/rspec'

Clicksign.configure do |config|
  config.endpoint = 'http://example.com'
end

Dir['./spec/support/**/*.rb'].each { |f| require f }
