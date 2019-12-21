# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Pitbull::Configuration::AuthorizationApi, type: :model do
  describe '#after_configure' do
    subject { instance.after_configure }

    let(:url) { Faker::Internet.url }
    let(:access_token_header) { 'X-MyAuthorizationApi-Access-Token' }
    let(:access_token_value) { SecureRandom.uuid }

    let(:instance) do
      described_class.new.tap do |config|
        config.url = url
        config.access_token_header = access_token_header
        config.access_token_value = access_token_value
      end
    end

    before { subject }

    it do
      expect(Katinguele.configuration.services[:authorization_api]).to have_attributes(
        raise_error: true,
        url: url,
        headers: {
          'Content-Type' => 'application/json',
          access_token_header => access_token_value
        }
      )
    end
  end
end
