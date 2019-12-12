# frozen_string_literal: true

module Pitbull
  class Configuration
    SETTINGS = %i[static authorization_api].freeze

    attr_accessor(*SETTINGS)

    def initialize
      SETTINGS.each { |key, _| instance_variable_set("@#{key}", initialize_setting(key)) }
    end

    def after_configure
      SETTINGS.each { |_, value| value.send(:after_configure) if value.respond_to?(:after_configure) }
    end

    private

    def initialize_setting(setting)
      "Pitbull::Configuration::#{setting.to_s.camelcase}".constantize.new
    end
  end
end

require 'pitbull/configuration/static'
require 'pitbull/configuration/authorization_api'
