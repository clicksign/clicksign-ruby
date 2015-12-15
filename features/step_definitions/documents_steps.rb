Dado(/^que minha conta não tem documentos$/) do
  @client = Clicksign.client { |config| config.access_token = ENV['EMPTY_TOKEN'] }
end

Quando(/^obtenho a listagem dos documento$/) do
  @documents = @client.documents.all
end

Então(/^a listagem dos documentos deve estar vazia$/) do
  expect(@documents).to be_empty
end

Dado(/^que minha conta tem alguns documentos$/) do
  @client = Clicksign.client { |config| config.access_token = ENV['ACCESS_TOKEN'] }
end

Então(/^a listagem dos documentos não deve estar vazia$/) do
  expect(@documents).to_not be_empty
end
