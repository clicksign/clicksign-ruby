require 'spec_helper'

describe Clicksign::Command::Documents, stub: 'documents' do
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
