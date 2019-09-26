# frozen_string_literal: true

Pitbull.configure do |config|
  config.static.header = Pitbull.static.default_header('MyAppName')
  config.static.token = 'my static token value'
end
