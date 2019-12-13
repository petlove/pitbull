# frozen_string_literal: true

module Pitbull
  module Strategies
    module AuthorizationApi
      class Authorizer
        class Unauthorized < StandardError; end

        extend Falcon::Client

        falcon_options :authorization_api

        class << self
          def perform(request)
            post(
              merge_in_headers: { params.authorization_token_header => params.authorization_token_value.call(request) }
              .select { |k, _v| k },
              after: ->(response) { handle(response) }
            )
          end

          private

          def handle(response)
            raise Unauthorized unless response.code == params.success_http_code
          end

          def params
            Pitbull.authorization_api
          end
        end
      end
    end
  end
end
