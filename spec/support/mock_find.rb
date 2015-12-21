require 'json'

shared_context 'mock find' do
  before do
    stub_request(:get, 'http://example.com/api/v1/documents/coffee').
      with(query: { access_token: 'token' }).
      to_return(body: { document: {}}.to_json, status: 200)

    stub_request(:get, 'http://example.com/api/v1/documents/bad').
      with(query: { access_token: 'token' }).
      to_return(body: {}.to_json, status: 500)
  end
end
