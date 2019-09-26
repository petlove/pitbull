# frozen_string_literal: true

RSpec.describe Healthcheck, type: :module do
  it { expect(described_class::VERSION).not_to be nil }
end
