# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ApiStaticController, type: :controller do
  describe '#check' do
    subject { get :check }
    let(:authentication) { nil }

    before do
      authentication
      subject
    end

    context 'without token in header' do
      it { expect(response.status).to eq(401) }
    end

    context 'with token in header' do
      let(:authentication) { static_authenticate(token) }

      context 'with different value' do
        let(:token) { 'test' }

        it { expect(response.status).to eq(401) }
      end

      context 'with equal value' do
        let(:token) { Pitbull.static.token }

        it { expect(response.status).to eq(200) }
      end
    end
  end
end
