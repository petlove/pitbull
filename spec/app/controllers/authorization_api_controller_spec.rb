# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AuthorizationApiController, type: :controller do
  it_behaves_like 'strategies_authorization_api'
end
