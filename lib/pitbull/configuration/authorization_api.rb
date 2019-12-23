# frozen_string_literal: true

module Pitbull
  class Configuration
    class AuthorizationApi
      attr_accessor :url, :access_token_header, :access_token_value, :success_http_code, :authorization_token_header,
                    :authorization_token_value

      def after_configure
        return unless @url

        Eezee.configure do |config|
          config.add_service :authorization_api,
                             raise_error: true,
                             url: @url,
                             headers: {
                               'Content-Type' => 'application/json',
                               @access_token_header => @access_token_value
                             }.select { |k, _v| k }
        end
      end
    end
  end
end
