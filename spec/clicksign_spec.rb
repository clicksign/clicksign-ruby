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

  describe '.create' do
    it 'sends document and list params' do
      file = File.new('spec/fixtures/all_documents.json')
      signers = { act: 'sign', email: 'john.doe@example.com' }
      message = 'Sign it please.'
      skip_email = false

      expect(RestClient).to receive(:post)
      .with(
        "http://example.com/v1/documents?access_token=my_token",
        {
        'document[archive][original]' => file,
        message: message,
        skip_email: skip_email,
        'signers'  => [signers],
      }, { accept: 'json' }).and_return({})

      Clicksign::Document.create(file, {
        signers: signers,
        message: message,
        skip_email: skip_email
      })
    end
  end

  describe '.resend' do
    it 'resends document to an email' do
      key = "1123-4567-89ab-cdef"
      email = 'jane.doe@example.com'
      message = 'This is a reminder for you. Please sign the document.'

      expect(RestClient).to receive(:post)
      .with(
        "http://example.com/v1/documents/#{key}/resend?access_token=my_token",
        { email: email,
        message: message }.to_json,
        { content_type: 'json', accept: 'json' }).and_return({})

      Clicksign::Document.resend(key, email, message)
    end
  end

  describe '.cancel' do
    it 'cancels document' do
      key = "1123-4567-89ab-cdef"

      expect(RestClient).to receive(:post)
      .with(
        "http://example.com/v1/documents/#{key}/cancel?access_token=my_token",
        {}.to_json, { content_type: 'json', accept: 'json' }).and_return({})

      Clicksign::Document.cancel(key)
    end
  end

  describe '.download' do
    it 'downloads document' do
      key = "1123-4567-89ab-cdef"
      expect(RestClient).to receive(:get)
      .with("http://example.com/v1/documents/#{key}/download?access_token=my_token")
      .and_return({})

      Clicksign::Document.download(key)
    end
  end
end
