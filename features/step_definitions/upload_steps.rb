Dado(/^que tenho um arquivo$/) do
  @file = File.open(File.expand_path('../../fixtures/sample.pdf', __FILE__))
end

Quando(/^subo o arquivo$/) do
  @document = @client.documents.create(file: @file)
end

Então(/^devo obter um documento$/) do
  expect(@document).to be_kind_of(Clicksign::Document)
end
