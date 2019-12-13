# frozen_string_literal: true

require 'vcr'
require 'webmock'

class VCRConfig
  FILTER = %w[
    AUTHORIZATION_API_URL
    AUTHORIZATION_API_NAME
    AUTHORIZATION_API_ACCESS_TOKEN
    AUTHORIZATION_TOKEN
    AUTHORIZATION_RESPONSE
  ].freeze

  def self.configure
    VCR.configure do |config|
      config.allow_http_connections_when_no_cassette = false
      config.cassette_library_dir = 'spec/cassettes'
      config.hook_into :webmock
      config.ignore_localhost = true
      config.configure_rspec_metadata!

      FILTER.each do |env|
        config.filter_sensitive_data("ENV[#{env}]") { ENV[env] }
      end
    end
  end
end
