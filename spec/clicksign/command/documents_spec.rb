require 'spec_helper'

describe Clicksign::Command::Documents do
  include_context 'mock list'
  subject(:client) { Clicksign.client }

  context 'without any document' do
    before do
      Clicksign.configure { |config| config.access_token = 'empty' }
    end

    it { expect(client.documents.all).to be_empty }
  end

  context 'with some documents' do
    before do
      Clicksign.configure { |config| config.access_token = 'some' }
    end

    it { expect(client.documents.all).to_not be_empty }
  end
end
