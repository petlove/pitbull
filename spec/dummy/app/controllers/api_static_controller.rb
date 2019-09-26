# frozen_string_literal: true

class ApiStaticController < ApplicationController
  include Pitbull::Strategies::Static

  def check
    head :ok
  end
end
