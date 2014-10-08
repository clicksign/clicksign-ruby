require 'spec_helper'

describe Clicksign do
  describe '.configure' do
    before do
      Clicksign.configure do |config|
        config.env   = :demo
        config.token = 'my_token'
      end
    end

    it 'set config values' do
      expect(Clicksign.env).to eq :demo
      expect(Clicksign.token).to eq 'my_token'
    end

    it 'setup proper endpoint' do
      expect(Clicksign.endpoint).to eq "https://api.clicksign-demo.com"
    end
  end
end

describe Clicksign::Document do
  describe '.all' do
    it 'returns a json with documents' do
      expect(RestClient).to receive(:get)
        .with("https://api.clicksign-demo.com/v1/documents?access_token=my_token", {accept: 'json'})
        .and_return(File.read('spec/fixtures/all_documents.json'))

      records = Clicksign::Document.all
      record  = records.first
      expect(record['document']['status']).to eq 'completed'
    end
  end

  describe '.find' do
    it "also parses xml" do
      Clicksign.configure do |config|
        config.format = 'xml'
      end

      expect(RestClient).to receive(:get)
        .with("https://api.clicksign-demo.com/v1/documents/B3E5-C645-3259-EDEC?access_token=my_token", {accept: 'xml'})
        .and_return(File.read('spec/fixtures/document.xml'))

      record = Clicksign::Document.find('B3E5-C645-3259-EDEC')
      expect(record['document']['status']).to eq 'editing'
    end
  end
end
