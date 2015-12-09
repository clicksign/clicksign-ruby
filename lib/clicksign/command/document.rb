require 'clicksign/command'

module Clicksign::Command::Document
  def documents
    get('api/v1/documents')
  end
end
