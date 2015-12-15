$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'clicksign'
require 'byebug'
require 'webmock/rspec'

Dir['./spec/support/**/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.before do
    Clicksign.configure do |config|
      config.endpoint = 'http://example.com/api/v1'
      config.access_token = 'token'
    end
  end
end
