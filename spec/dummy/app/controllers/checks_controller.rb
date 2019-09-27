# frozen_string_literal: true

class ChecksController < Pitbull::Strategies::StaticController
  def check
    head :ok
  end
end
