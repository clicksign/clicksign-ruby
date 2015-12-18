Dado(/^que tenho um documento$/) do
  @document = @client.documents.create(file: 'binary...')
end

Quando(/^cancelo o documento$/) do
  @document.cancel!
end

Então(/^o documento poussui uma data de cancelamento$/) do
  expect(@document.canceled_at).to_not be_nil
end
