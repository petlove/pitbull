# frozen_string_literal: true

class StaticController < ApplicationController
  include Pitbull::Strategies::Static

  before_action :static_authorize

  def check
    head :ok
  end
end
