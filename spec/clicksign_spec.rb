require 'spec_helper'

describe Clicksign do
  before do
    Clicksign.configure do |config|
      config.endpoint = 'http://example.com'
      config.access_token = 'token'
    end
  end

  it 'has a version number' do
    expect(Clicksign::VERSION).not_to be(nil)
  end

  it { expect(Clicksign.client).to be_a(Clicksign::Client) }

  context 'uses default config' do
    subject(:client) { Clicksign.client }
    it { expect(client.endpoint).to eq('http://example.com') }
    it { expect(client.access_token).to eq('token') }
  end

  context 'override client config' do
    subject(:client) do
      Clicksign.client do |config|
        config.endpoint = 'http://example.org'
        config.access_token = 'nekot'
      end
    end

    it { expect(client.endpoint).to eq('http://example.org') }
    it { expect(client.access_token).to eq('nekot') }
  end
end
