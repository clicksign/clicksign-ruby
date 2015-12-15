Dado(/^que tenho uma chave de API válida$/) do
  Clicksign.configure do |config|
    config.access_token = ENV['ACCESS_TOKEN']
  end
end

Quando(/^obtenho um cliente da biblioteca$/) do
  @client = Clicksign.client
end

Então(/^o cliente deve estar autenticado$/) do
  expect(@client).to be_authenticated
end

Dado(/^que tenho uma chave de API inválida$/) do
  Clicksign.configure do |config|
    config.access_token = 'invalid'
  end
end

Então(/^o cliente não deve estar autenticado$/) do
  expect(@client).to_not be_authenticated
end
