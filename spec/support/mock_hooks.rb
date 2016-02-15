require 'json'

shared_context 'mock hooks' do
  before do
    stub_request(:get, 'http://example.com/api/v1/documents/123/hooks')
    .with(query: { access_token: 'token' })
    .to_return(body: [].to_json, status: 200)

    stub_request(:get, 'http://example.com/api/v1/documents/17/hooks')
    .with(query: { access_token: 'token' })
    .to_return(body: [{"id":40330,"url":"http://example.com","created_at":"2016-01-28T19:16:40.587-02:00","updated_at":"2016-01-28T19:16:40.587-02:00"}].to_json, status: 200)
  end
end
