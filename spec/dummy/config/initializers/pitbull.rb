# frozen_string_literal: true

Pitbull.configure do |config|
  ## --- Static Strategy ---
  config.static.header = Pitbull.static.default_header('MyAppName')
  config.static.token = '4c4074dc2243f7f00e98bce78547a67be3058bada3a6fbd4462c7684b2841e9b'

  ## --- Authorization Api Strategy ---
  config.authorization_api.url = ENV['AUTHORIZATION_API_URL']
  config.authorization_api.access_token_header = Pitbull.static.default_header(ENV['AUTHORIZATION_API_NAME'])
  config.authorization_api.access_token_value = ENV['AUTHORIZATION_API_ACCESS_TOKEN']
  config.authorization_api.success_http_code = 200
  config.authorization_api.authorization_token_header = 'Authorization'
  config.authorization_api.authorization_token_value = -> { request.headers['Authorization'] }
end
