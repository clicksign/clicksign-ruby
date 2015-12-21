Dado(/^que minha conta não tem documentos$/) do
  @client = Clicksign.client { |config| config.access_token = 'empty' }
end

Quando(/^obtenho a listagem dos documento$/) do
  @documents = @client.documents.all
end

Então(/^a listagem dos documentos deve estar vazia$/) do
  expect(@documents).to be_empty
end

Dado(/^que minha conta tem alguns documentos$/) do
  @client = Clicksign.client { |config| config.access_token = 'some' }
end

Então(/^a listagem dos documentos não deve estar vazia$/) do
  expect(@documents).to_not be_empty
end

Dado(/^que tenho um documento$/) do
  @document = @client.documents.create(file: 'binary...')
end

Quando(/^cancelo o documento$/) do
  @document.cancel!
end

Então(/^o documento poussui uma data de cancelamento$/) do
  expect(@document.canceled_at).to_not be_nil
end

Dado(/^que tenho um documento não empacotado$/) do
  @document = @client.documents.find('42')
end

Quando(/^baixo o documento$/) do
  @download = @document.download
end

Então(/^recebo um arquivo zip$/) do
  expect(@download).to be_kind_of(String)
end

Dado(/^que tenho um arquivo$/) do
  @file = File.open(File.expand_path('../../fixtures/sample.pdf', __FILE__))
end

Quando(/^subo o arquivo$/) do
  @document = @client.documents.create(file: @file)
end

Dado(/^que tenho uma chave válida de documento$/) do
  @key = 'coffee'
end

Quando(/^busco o documento pela sua chave$/) do
  @document = @client.documents.find(@key)
end

Então(/^obtenho o documento$/) do
  expect(@document).to be_kind_of(Clicksign::Document)
end

Dado(/^que tenho uma chave inválida de documento$/) do
  @key = 'invalid'
end

Então(/^obtenho um documento vazio$/) do
  expect(@documet).to be_kind_of(NilClass)
end
