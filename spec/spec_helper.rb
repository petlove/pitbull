# frozen_string_literal: true

require 'bundler/setup'
require 'support/configs/simple_cov_config'
require 'support/configs/vcr_config'

SimpleCovConfig.configure

require 'dotenv'
Dotenv.load('.env.test')

require File.expand_path('../spec/dummy/config/environment.rb', __dir__)
ENV['RAILS_ROOT'] ||= File.dirname(__FILE__) + '../../../spec/dummy'

require 'rspec/rails'
require 'pitbull'

VCRConfig.configure

require 'support/helpers/static_helper'
require 'support/shared/strategies_static'
require 'support/shared/strategies_authorization_api'

RSpec.configure do |config|
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include StaticHelper
end
