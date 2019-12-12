# frozen_string_literal: true

require 'spec_helper'

RSpec.shared_examples_for 'strategies_authorization_api' do
  describe '#check', :vcr do
    subject { post :check }
    let(:authorization) { nil }

    before do
      authorization
      subject
    end

    context 'with valid accessor token and invalid jwt token' do
      let(:authorization) do
        request.headers['Authorization'] = '1.2.3'
      end

      it { expect(response).to have_http_status :unauthorized }
    end

    context 'with valid accessor token and jwt token' do
      let(:authorization) do
        request.headers['Authorization'] = ENV['AUTHORIZATION_TOKEN']
      end

      it { expect(response).to have_http_status :ok }
      it { expect(response.body).to eq(ENV['AUTHORIZATION_RESPONSE']) }
    end
  end
end
