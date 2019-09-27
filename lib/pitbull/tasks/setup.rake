# frozen_string_literal: true

require 'fileutils'

SETTINGS = 'config/initializers/pitbull.rb'

namespace :pitbull do
  desc 'Install the initializer to the gem Pitbull works'
  task :install do
    create_initializer
  end
end

def create_initializer
  FileUtils.mkdir_p(File.dirname(SETTINGS))
  File.open(SETTINGS, 'w') { |file| file << settings }
end

def settings
  <<~SETTINGS
    # frozen_string_literal: true

    Pitbull.configure do |config|
      config.static.header = Pitbull.static.default_header('MyAppName')
      config.static.token = 'my static token value'
    end
  SETTINGS
end
