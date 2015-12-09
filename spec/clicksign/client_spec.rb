require 'spec_helper'

describe Clicksign::Client, stub: 'whoami' do
  subject(:client) do
    Clicksign.client do |config|
      config.endpoint = 'http://example.org'
      config.access_token = 'token'
    end
  end

  it { expect(client.endpoint).to eq('http://example.org') }
  it { expect(client.access_token).to eq('token') }
end
