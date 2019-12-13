# frozen_string_literal: true

require_relative 'authorization_api/authorizer'

module Pitbull
  module Strategies
    module AuthorizationApi
      extend ::ActiveSupport::Concern

      def authorization_api
        Authorizer.perform(request)
                  .then { |res| @authorization_response = res.body }
      rescue Pitbull::Strategies::AuthorizationApi::Authorizer::Unauthorized
        head :unauthorized
      end
    end
  end
end
