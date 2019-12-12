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

## Using

To use any strategy you need to set the configs on the initializer and include the strategy in your controller. You also can extend a Pitbull strategy controller.

Available strategies

| name | mixin | controller | how it works |
|------|-------|------------|--------------|
| Static | `Pitbull::Strategies::Static` | `Pitbull::Strategies::StaticController` | It verifies if the request contains a header with the name defined in `config.static.header` with the value set
in `config.static.token`. If the values are different it returns an unauthorized response (HTTP code 401). |
| Authorization Api | `Pitbull::Strategies::AuthorizationApi` | `Pitbull::Strategies::AuthorizationApiController` | It makes a request to your authorization server through settings defined in initializer. If the response HTTP code is different of success HTTP code setting it returns an unauthorized response (HTTP code 401). If it has a successful response, the response will be set in `@authorization_response`. |

## Settings
Set the settings in the file _config/initializers/pitbull.rb_:

```ruby
# frozen_string_literal: true

Pitbull.configure do |config|
  ## --- Static Strategy ---
  # The application access token header's name for static authorization
  # You can choose the name or use the helper Pitbull.static.default_header passing your app's name
  # config.static.header = Pitbull.static.default_header('MyAppName') # X-MyAppName-Access-Token
  # The application access token header's value for static authorization
  # config.static.token = '4c4074dc2243f7f00e98bce78547a67be3058bada3a6fbd4462c7684b2841e9b'

  ## --- Authorization Api Strategy ---
  # The authorization api's url of your authorization's server
  #config.authorization_api.url = ENV['AUTHORIZATION_API_URL'] # https://my-authorization-api.domain.com
  # Optional - The authorization api's static access token header of your authorization's server
  # config.authorization_api.access_token_header = 'X-MyAuthorizationApi-Access-Token'
  # Optional - The authorization api's static access token value of your authorization's server
  # config.authorization_api.access_token_value = '4c4074dc2243f7f00e98bce78547a67be3058bada3a6fbd4462c7684b2841e9b'
  # The authorization api's http success code
  # config.authorization_api.success_http_code = 200
end
```

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