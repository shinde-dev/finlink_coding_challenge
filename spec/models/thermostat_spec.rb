# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Thermostat, type: :model do
  describe 'schema' do
    it { is_expected.to have_db_column(:household_token).of_type(:text) }
    it { is_expected.to have_db_column(:id).of_type(:uuid) }
    it { is_expected.to have_db_column(:location).of_type(:string) }
  end

  describe 'valid' do
    it 'is valid with valid attributes' do
      expect(FactoryBot.create(:thermostat)).to be_valid
    end

    it 'is valid without location' do
      thermostat = FactoryBot.build(:thermostat, location: nil)
      expect(thermostat).to be_valid
    end
  end

  describe 'invalid' do
    it 'is invalid without household_token' do
      thermostat = FactoryBot.build(:thermostat, household_token: nil)
      expect(thermostat).not_to be_valid
    end
  end
end
