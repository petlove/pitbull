# frozen_string_literal: true

class StaticController < ApplicationController
  include Pitbull::Strategies::Static

  before_action :authorize_by_static

  def check
    head :ok
  end
end
