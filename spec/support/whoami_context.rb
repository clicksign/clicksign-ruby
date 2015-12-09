shared_context stub: 'whoami' do
    before do
      stub_request(:get, 'http://example.com/api/v1/whoami')
        .with(query: { access_token: 'token' })
        .to_return(status: 200)

      stub_request(:get, 'http://example.com/api/v1/whoami')
        .with(query: { access_token: 'invalid' })
        .to_return(status: 401)
    end
end
