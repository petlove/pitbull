# frozen_string_literal: true

RSpec.describe Pitbull, type: :module do
  it { expect(described_class::VERSION).not_to be_nil }

  describe '.configure' do
    let(:static_header) { Pitbull.static.default_header('Pitbull') }
    let(:static_token) { '5bf775d8-662d-4f0a-a344-9bb7f4323c31' }

    subject do
      described_class.configure do |config|
        config.static.header = static_header
        config.static.token = static_token
      end
    end

    before { subject }

    it { expect(described_class.configuration).to be_a(Pitbull::Configuration) }
    it { expect(described_class.static).to be_a(Pitbull::Configuration::Static) }
    it { expect(described_class.static.header).to eq(static_header) }
    it { expect(described_class.static.token).to eq(static_token) }
  end

  describe '.configuration' do
    subject { described_class.configuration }

    it { is_expected.to be_a(described_class::Configuration) }
  end
end
