Dado(/^que tenho um documento não empacotado$/) do
  @document = @client.documents.find('42')
end

Quando(/^baixo o documento$/) do
  @download = @document.download
end

Então(/^recebo um arquivo zip$/) do
  expect(@download).to be_kind_of(String)
end
