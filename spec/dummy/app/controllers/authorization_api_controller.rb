# frozen_string_literal: true

class AuthorizationApiController < ApplicationController
  include Pitbull::Strategies::AuthorizationApi

  before_action :authorize_by_authorization_api

  def check
    render json: @authorization_response
  end
end
