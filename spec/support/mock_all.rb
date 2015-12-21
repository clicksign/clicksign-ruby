require 'json'

shared_context 'mock all' do
  before do
    document = { document: { key: '17' }}

    stub_request(:get, 'http://example.com/api/v1/documents')
    .with(query: { access_token: 'empty' })
    .to_return(body: [].to_json, status: 200)

    stub_request(:get, 'http://example.com/api/v1/documents')
    .with(query: { access_token: 'some' })
    .to_return(body: [document, document, document].to_json, status: 200)
  end
end
