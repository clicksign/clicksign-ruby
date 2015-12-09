Dado(/^que minha conta não tem documentos$/) do
  @client = Clicksign.client { |config| config.access_token = ENV['EMPTY_TOKEN'] }
end

Quando(/^obtenho a listagem dos documento$/) do
  @client.documents.all
end

Então(/^a listagem dos documentos deve estar vazia$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
