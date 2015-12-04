Dado(/^que tenho uma chave de API válida$/) do
  Clicksign.configure do |config|
    config.access_token = ENV['ACCESS_TOKEN']
  end
end

Quando(/^obtenho um cliente da biblioteca$/) do
  @client = Clicksign.client
end

Então(/^ele deve estar autenticado$/) do
  expect(@client).to be_authenticated
end
