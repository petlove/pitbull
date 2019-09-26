# frozen_string_literal: true

module Pitbull
  class Configuration
    SETTINGS = %i[static].freeze

    attr_accessor(*SETTINGS)

    def initialize
      SETTINGS.each { |key, _| instance_variable_set("@#{key}", initialize_setting(key)) }
    end

    private

    def initialize_setting(setting)
      "Pitbull::Configuration::#{setting.capitalize}".constantize.new
    end
  end
end
