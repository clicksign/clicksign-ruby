require 'clicksign'

Clicksign.configure do |config|
  config.token = ENV['CLICKSIGN_TOKEN']
end

# Create a document
doc = Clicksign::Document.create(File.new('/deal.pdf'))

# Get Key identification
doc_key = doc['document']['key']

# Create a new signature list
result = Clicksign::Document.create_list(doc_key, { email: 'john.doe@example.com', act: 'sign' })

# Print document details with signatures and list
puts result
