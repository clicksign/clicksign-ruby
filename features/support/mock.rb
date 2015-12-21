require 'json'
require 'webmock/cucumber'

Before do
  document = { document: { key: '17' }}

  stub_request(:get, 'http://example.com/whoami').
    with(query: { access_token: 'valid' }).
    to_return(status: 200, body: nil)

  stub_request(:get, 'http://example.com/whoami').
    with(query: { access_token: 'invalid' }).
    to_return(status: 401, body: nil)

  stub_request(:get, 'http://example.com/documents').
    with(query: { access_token: 'empty' }).
    to_return(status: 200, body: [].to_json)

  stub_request(:get, 'http://example.com/documents').
    with(query: { access_token: 'some' }).
    to_return(status: 200, body: [document, document].to_json)

  stub_request(:post, 'http://example.com/documents').
    with(query: { access_token: 'token' }).
    to_return(status: 200, body: { key: '17' }.to_json)

  stub_request(:post, 'http://example.com/documents/17/cancel').
    with(query: { access_token: 'token' }).
    to_return(status: 200, body: { document: { key: '17', list: { canceled_at: 'now' }}}.to_json)

  stub_request(:get, 'http://example.com/documents/17/download').
    with(query: { access_token: 'token' }).
    to_return(status: 200, body: 'content...')

  stub_request(:get, 'http://example.com/documents/coffee').
    with(query: { access_token: 'token' }).
    to_return(status: 200, body: { document: { key: '17' }}.to_json)

  stub_request(:get, 'http://example.com/documents/invalid').
    with(query: { access_token: 'token' }).
    to_return(status: 500, body: nil)
end
