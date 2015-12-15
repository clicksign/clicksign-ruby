Dado(/^que tenho um arquivo para ser assinado$/) do
  @file = File.open(File.expand_path('../../fixtures/sample.pdf', __FILE__))
end

Quando(/^subo o arquivo sem emails para assinaram$/) do
  @document = @client.documents.create(file: @file)
end

Quando(/^subo o arquivo com emails para assinaram$/) do
  @document = @client.documents.create \
    file: @file,
    message: 'Please, sign this document',
    signers: {
      'jane.doe@example.com' => 'sign',
      'jane.roe@example.com' => 'sign',
      'john.joe@example.com' => 'witness',
    }
end

Então(/^o status do documento é "([^"]*)"$/) do |status|
  expect(@document.status).to eq(status)
end
