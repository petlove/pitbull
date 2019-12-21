# frozen_string_literal: true

module Pitbull
  module Strategies
    module AuthorizationApi
      class Authorizer
        class Unauthorized < StandardError; end

        extend Katinguele::Client

        katinguele_service :authorization_api, lazy: true

        class << self
          def perform(controller_req)
            post(
              before: ->(req) { req.headers.merge!(authorization_header(controller_req)) },
              after: ->(_req, res) { handle(res) }
            )
          end

          def authorization_header(controller_req)
            { params.authorization_token_header => params.authorization_token_value.call(controller_req) }
              .select { |k, _v| k }
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
