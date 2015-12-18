require 'json'
require 'webmock/cucumber'

Before do
  document = { document: { key: '17' }}

  stub_request(:get, 'http://example.com/whoami?access_token=valid').
    to_return(status: 200, body: nil)

  stub_request(:get, 'http://example.com/whoami?access_token=invalid').
    to_return(status: 401, body: nil)

  stub_request(:get, 'http://example.com/documents?access_token=empty').
    to_return(status: 200, body: [].to_json)

  stub_request(:get, 'http://example.com/documents?access_token=some').
    to_return(status: 200, body: [document, document].to_json)

  stub_request(:post, 'http://example.com/documents?access_token=token').
    to_return(status: 200, body: document.to_json)

  stub_request(:post, 'http://example.com/documents/17/cancel?access_token=token').
    to_return(status: 200, body: { document: { key: '17', list: { canceled_at: 'now' }}}.to_json)
end
