require 'json'

shared_context 'mock resend' do
  before do
    stub_request(:post, 'http://example.com/api/v1/documents/17/resend')
    .with(query: { access_token: 'token' },
          body: { email: 'existing@example.com' })
    .to_return(body: {}.to_json, status: 200)
  end

  before do
    stub_request(:post, 'http://example.com/api/v1/documents/17/resend')
    .with(query: { access_token: 'token' },
          body: { email: 'missing@example.com' })
    .to_return(body: {}.to_json, status: 404)
  end
end
