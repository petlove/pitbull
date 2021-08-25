# frozen_string_literal: true

require_relative 'authorization_api/authorizer'

module Pitbull
  module Strategies
    module AuthorizationApi
      extend ::ActiveSupport::Concern

      def authorize_by_authorization_api
        Rails.logger.info("PASSOU AQUI: #{__method__}")
        Authorizer.perform(request)
                  .then { |res| @authorization_response = res.body }
      rescue Pitbull::Strategies::AuthorizationApi::Authorizer::Unauthorized
        head :unauthorized
      end
    end
  end
end
