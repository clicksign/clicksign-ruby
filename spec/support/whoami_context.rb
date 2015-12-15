require 'json'

shared_context stub: 'whoami' do
  before do
    stub_request(:get, 'http://example.com/api/v1/whoami')
    .with(query: { access_token: 'token' })
    .to_return(body: {}.to_json, status: 200)

    stub_request(:get, 'http://example.com/api/v1/whoami')
    .with(query: { access_token: 'invalid' })
    .to_return(body: {}.to_json, status: 401)
  end
end
