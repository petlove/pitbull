# [Pitbull][gem_page]

[![Build Status][travis_status_image]][travis_page]
[![Maintainability][code_climate_maintainability_image]][code_climate_maintainability_page]
[![Test Coverage][code_climate_test_coverage_image]][code_climate_test_coverage_page]

A simple way to authenticate in APIs

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pitbull', github: 'petlove/pitbull'
```

and run:

```
rails pitbull:install
```

## Settings
Set the settings in the file _config/initializers/pitbull.rb_:

```ruby
# frozen_string_literal: true

Pitbull.configure do |config|
  config.static.header = Pitbull.static.default_header('MyAppName')
  config.static.token = 'my static token value'
end
```

## Static Authentication

Send a header with the name equal `config.static.header` with the value equal `config.static.token`.

After it, you need to include `Pitbull::Strategies::Static` in your controller or inherit the controller `Pitbull::Strategies::StaticController`.


## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## License

The gem is available as open source under the terms of the [MIT License][mit_license_page].

## Code of Conduct

Everyone interacting in the Rails::Healthcheck project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct][code_of_conduct_page].

[gem_page]: https://github.com/petlove/pitbull
[code_of_conduct_page]: https://github.com/petlove/pitbull/blob/master/CODE_OF_CONDUCT.md
[mit_license_page]: https://opensource.org/licenses/MIT
[contributor_convenant_page]: http://contributor-covenant.org
[travis_status_image]: https://travis-ci.org/petlove/pitbull.svg?branch=master
[travis_page]: https://travis-ci.org/petlove/pitbull
[code_climate_maintainability_image]: https://api.codeclimate.com/v1/badges/46c218fa0151fca701f3/maintainability
[code_climate_maintainability_page]: https://codeclimate.com/github/petlove/pitbull/maintainability
[code_climate_test_coverage_image]: https://api.codeclimate.com/v1/badges/46c218fa0151fca701f3/test_coverage
[code_climate_test_coverage_page]: https://codeclimate.com/github/petlove/pitbull/test_coverage