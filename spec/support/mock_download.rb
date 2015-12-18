shared_context 'mock download' do
  before do
    stub_request(:get, "http://example.com/api/v1/documents/200/download?access_token=token")
    .to_return(status: 200, body: 'content...')

    stub_request(:get, "http://example.com/api/v1/documents/201/download?access_token=token")
    .to_return({ status: 201, body: nil }, { status: 201, body: nil }, { status: 200, body: 'content...' })

    stub_request(:get, "http://example.com/api/v1/documents/404/download?access_token=token").to_timeout
    stub_request(:get, "http://example.com/api/v1/documents/500/download?access_token=token").to_raise
  end
end
