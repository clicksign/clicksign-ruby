require 'clicksign/command'

module Clicksign::Command::Whoami
  def authenticated?
    resource['whoami'].get
  rescue RestClient::Unauthorized
    false
  end
end
