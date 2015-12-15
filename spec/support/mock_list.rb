require 'json'

shared_context 'mock list' do
  before do
    stub_request(:get, 'http://example.com/api/v1/documents')
    .with(query: { access_token: 'empty' })
    .to_return(body: [].to_json, status: 200)

    stub_request(:get, 'http://example.com/api/v1/documents')
    .with(query: { access_token: 'some' })
    .to_return(body: [1,2,3].to_json, status: 200)
  end
end
