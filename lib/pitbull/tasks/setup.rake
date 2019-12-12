# frozen_string_literal: true

require 'fileutils'

PITBULL_SETTINGS = 'config/initializers/pitbull.rb'

namespace :pitbull do
  desc 'Install the initializer to the gem Pitbull works'
  task :install do
    create_initializer
  end
end

def create_initializer
  FileUtils.mkdir_p(File.dirname(PITBULL_SETTINGS))
  File.open(PITBULL_SETTINGS, 'w') { |file| file << settings }
end

def settings
  <<~PITBULL_SETTINGS
    # frozen_string_literal: true

    Pitbull.configure do |config|
      ## --- Static Strategy ---
      # The application access token header's name for static authorization
      # You can choose the name or use the helper Pitbull.static.default_header passing your app's name
      # config.static.header = Pitbull.static.default_header('MyAppName') # X-MyAppName-Access-Token
      # The application access token header's value for static authorization
      # config.static.token = '4c4074dc2243f7f00e98bce78547a67be3058bada3a6fbd4462c7684b2841e9b'

      ## --- Authorization Api Strategy ---
      # The authorization api's url of your authorization's server
      #config.authorization_api.url = ENV['AUTHORIZATION_API_URL'] # https://my-authorization-api.domain.com
      # Optional - The authorization api's static access token header of your authorization's server
      # config.authorization_api.access_token_header = 'X-MyAuthorizationApi-Access-Token'
      # Optional - The authorization api's static access token value of your authorization's server
      # config.authorization_api.access_token_value = '4c4074dc2243f7f00e98bce78547a67be3058bada3a6fbd4462c7684b2841e9b'
      # The authorization api's http success code
      # config.authorization_api.success_http_code = 200
    end
  PITBULL_SETTINGS
end
