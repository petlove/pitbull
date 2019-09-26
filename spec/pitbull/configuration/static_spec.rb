# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Pitbull::Configuration::Static, type: :model do
  describe '#default_header' do
    subject { described_class.new.default_header(name) }

    context 'with name' do
      let(:name) { 'app' }

      it { is_expected.to eq('X-app-Access-Token') }
    end
  end
end
