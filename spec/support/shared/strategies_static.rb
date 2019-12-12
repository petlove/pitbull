# frozen_string_literal: true

require 'spec_helper'

RSpec.shared_examples_for 'strategies_static' do
  describe '#check' do
    subject { get :check }
    let(:authorization) { nil }

    before do
      authorization
      subject
    end

    context 'without token in header' do
      it { expect(response.status).to eq(401) }
    end

    context 'with token in header' do
      let(:authorization) { static_authorize(token) }

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
