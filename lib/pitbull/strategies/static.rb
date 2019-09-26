# frozen_string_literal: true

module Pitbull
  module Strategies
    module Static
      extend ::ActiveSupport::Concern

      included do
        before_action :authenticate
      end

      private

      def authenticate
        return head :unauthorized unless authorized?
      end

      def authorized?
        header && token && header == token
      end

      def header
        request.headers[Pitbull.static.header]
      end

      def token
        Pitbull.static.token
      end
    end
  end
end
