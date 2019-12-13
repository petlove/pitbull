# frozen_string_literal: true

module Pitbull
  class Configuration
    SETTINGS = %i[static authorization_api].freeze

    attr_accessor(*SETTINGS)

    def initialize
      SETTINGS.each { |key, _| instance_variable_set("@#{key}", initialize_setting(key)) }
    end

    def after_configure
      SETTINGS.each do |setting|
        next unless send(setting).respond_to?(:after_configure)

        send(setting).send(:after_configure)
      end
    end

    private

    def initialize_setting(setting)
      "Pitbull::Configuration::#{setting.to_s.camelcase}".constantize.new
    end
  end
end

require_relative 'configuration/static'
require_relative 'configuration/authorization_api'
