require 'spec_helper'

describe Clicksign::Command::Whoami, stub: 'whoami' do
  subject(:client) { Clicksign.client }

  context 'with valid token' do
    before do
      Clicksign.configure { |config| config.access_token = 'token' }
    end

    it { expect(client).to be_authenticated }
  end

  context 'with valid intoken' do
    before do
      Clicksign.configure { |config| config.access_token = 'invalid' }
    end

    it { expect(client).to_not be_authenticated }
  end
end
