require 'spec_helper'

describe Clicksign::Command::Documents do
  include_context 'mock all'
  include_context 'mock find'

  subject(:client) { Clicksign.client }

  context 'without any document' do
    before { Clicksign.configure { |config| config.access_token = 'empty' }}
    it { expect(client.documents.all).to be_empty }
  end

  context 'with some documents' do
    before { Clicksign.configure { |config| config.access_token = 'some' }}
    it { expect(client.documents.all).to_not be_empty }
  end

  context 'find a document with good key' do
    subject(:document) { client.documents.find('coffee') }
    it { expect(document).to be_kind_of(Clicksign::Document) }
  end

  context 'find a document with missing key' do
    subject(:document) { client.documents.find('bad') }
    it { expect(document).to be_kind_of(NilClass) }
  end
end
