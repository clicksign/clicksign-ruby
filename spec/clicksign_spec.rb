require 'spec_helper'

describe Clicksign do
  describe '.configure' do
    before do
      Clicksign.configure do |config|
        config.endpoint = 'http://example.com'
        config.token    = 'my_token'
      end
    end

    it 'set config values' do
      expect(Clicksign.endpoint).to eq "http://example.com"
      expect(Clicksign.token).to eq 'my_token'
    end
  end
end

describe Clicksign::Document do
  describe '.all' do
    it 'returns a hash with documents' do
      expect(RestClient).to receive(:get)
        .with("http://example.com/v1/documents?access_token=my_token", {accept: 'json'})
        .and_return(File.read('spec/fixtures/all_documents.json'))

      records = Clicksign::Document.all
      record  = records.first
      expect(record['document']['status']).to eq 'completed'
    end
  end
end
