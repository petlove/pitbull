# frozen_string_literal: true

require 'active_support/all'
require 'falcon'
require 'pitbull/version'
require 'pitbull/configuration'
require 'pitbull/strategies/static'
require 'pitbull/strategies/authorization_api'

module Pitbull
  require 'pitbull/railtie' if defined?(Rails)

  Configuration::SETTINGS.each do |setting|
    send(:define_singleton_method, setting, -> { configuration.send(setting) })
  end

  def self.configure
    yield(configuration)
    configuration.after_configure
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
