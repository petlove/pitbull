# frozen_string_literal: true

class AuthorizationApiController < ApplicationController
  include Pitbull::Strategies::AuthorizationApi

  def check
    render json: @authorization_response
  end
end
