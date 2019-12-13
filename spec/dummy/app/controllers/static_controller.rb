# frozen_string_literal: true

class StaticController < ApplicationController
  include Pitbull::Strategies::Static

  def check
    head :ok
  end
end
