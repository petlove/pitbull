# frozen_string_literal: true

module Pitbull
  module Strategies
    module Static
      extend ::ActiveSupport::Concern

      def authorize_by_static
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
