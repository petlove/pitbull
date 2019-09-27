# frozen_string_literal: true

module Pitbull
  module Strategies
    class StaticController < ApplicationController
      include Pitbull::Strategies::Static
    end
  end
end
