# frozen_string_literal: true

module Pitbull
  class Configuration
    class Static
      attr_accessor :header, :token

      def default_header(app_name = 'Application')
        "X-#{app_name}-Access-Token"
      end
    end
  end
end
