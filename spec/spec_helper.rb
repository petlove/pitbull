# frozen_string_literal: true

require 'bundler/setup'
require 'support/configs/simple_cov_config'
SimpleCovConfig.configure

require File.expand_path('../spec/dummy/config/environment.rb', __dir__)
ENV['RAILS_ROOT'] ||= File.dirname(__FILE__) + '../../../spec/dummy'

require 'rspec/rails'
require 'pitbull'

require 'support/helpers/static_authentication_helper'

RSpec.configure do |config|
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include StaticAuthenticationHelper
end
