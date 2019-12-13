# frozen_string_literal: true

class AuthorizationApiController < ApplicationController
  include Pitbull::Strategies::AuthorizationApi

  before_action :authorization_api

  def check
    render json: @authorization_response
  end
end
