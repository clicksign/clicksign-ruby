require 'json'

shared_context 'mock upload' do
  before do
    stub_request(:post, 'http://example.com/api/v1/documents')
    .with(query: { access_token: 'token' })
    .to_return {{ body: { document: { key: '17' }}.to_json, status: 200 }}
  end
end
