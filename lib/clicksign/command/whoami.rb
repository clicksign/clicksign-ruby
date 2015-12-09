require 'clicksign/command'

module Clicksign::Command::Whoami
  def authenticated?
    get('api/v1/whoami')
  rescue RestClient::Unauthorized
    false
  end
end
