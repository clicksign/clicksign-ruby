require 'json'

shared_context 'mock cancel' do
  before do
    stub_request(:post, 'http://example.com/api/v1/documents/17/cancel')
    .with(query: { access_token: 'token' })
    .to_return(body: { document: { list: { canceled_at: 'today' }}}.to_json, status: 200)
  end
end
