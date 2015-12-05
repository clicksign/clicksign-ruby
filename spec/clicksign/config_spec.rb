require 'spec_helper'

describe Clicksign::Config do
  subject(:config) { Clicksign.config }

  before do
    Clicksign.configure do |config|
      config.endpoint = 'http://example.com'
      config.access_token = 'token'
    end
  end

  it { expect(config.endpoint).to eq('http://example.com') }
  it { expect(config.access_token).to eq('token') }
end
