# frozen_string_literal: true

require 'active_support/all'
require 'pitbull/version'
require 'pitbull/engine'
require 'pitbull/configuration'
require 'pitbull/configuration/static'
require 'pitbull/strategies/static'

module Pitbull
  require 'pitbull/railtie' if defined?(Rails)

  Configuration::SETTINGS.each do |setting|
    send(:define_singleton_method, setting, -> { configuration.send(setting) })
  end

  def self.configure
    yield(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
