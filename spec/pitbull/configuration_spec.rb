# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Pitbull::Configuration, type: :model do
  describe '#initialize' do
    subject { described_class.new }

    it { is_expected.to be_a(described_class) }
    it { expect(subject.static).to be_a(described_class::Static) }
  end
end
