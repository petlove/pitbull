# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pitbull/version'

Gem::Specification.new do |spec|
  spec.name          = 'pitbull'
  spec.version       = Pitbull::VERSION
  spec.authors       = ['linqueta']
  spec.email         = ['lincolnrodrs@gmail.com']

  spec.summary       = 'Authorization helper for APIs'
  spec.description   = 'Authorization helper for APIs'
  spec.homepage      = 'https://https://github.com/petlove/pitbull'
  spec.license       = 'MIT'

  spec.files         = Dir['{lib}/**/*', 'CHANGELOG.md', 'MIT-LICENSE', 'README.md']
  spec.required_ruby_version = '>= 2.6'

  spec.add_dependency 'activesupport', '>= 5.0'
  spec.add_dependency 'eezee', '>=1.0.9'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'dotenv', '~> 2.7.5'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'pry-byebug', '>= 3.7.0'
  spec.add_development_dependency 'rails', '>= 3.8.2'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'rubocop', '>= 0.74.0'
  spec.add_development_dependency 'rubocop-performance', '>= 1.4.1'
  spec.add_development_dependency 'simplecov', '>= 0.17.0'
  spec.add_development_dependency 'simplecov-console', '>= 0.5.0'
  spec.add_development_dependency 'vcr', '>= 5.0.0'
  spec.add_development_dependency 'webmock', '>= 3.7.6'
end
