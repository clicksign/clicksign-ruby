require 'spec_helper'

describe Clicksign::Client, stub: 'whoami' do
  subject(:client) { Clicksign.client }

  context 'with valid token' do
    before do
      Clicksign.configure do |config|
        config.endpoint = 'http://example.com'
        config.access_token = 'token'
      end
    end

    it { expect(client).to be_authenticated }
  end

  context 'with valid intoken' do
    before do
      Clicksign.configure do |config|
        config.endpoint = 'http://example.com'
        config.access_token = 'invalid'
      end
    end

    it { expect(client).to_not be_authenticated }
  end
end
