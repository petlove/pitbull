# frozen_string_literal: true

module Pitbull
  module Strategies
    module Static
      extend ::ActiveSupport::Concern

      included do
        before_action :static_authorized
      end

      private

      def static_authorized
        head :unauthorized unless header && token && header == token
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
