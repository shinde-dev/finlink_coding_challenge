# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reading, type: :model do
  describe 'schema' do
    it { is_expected.to have_db_column(:number).of_type(:integer) }
    it { is_expected.to have_db_column(:id).of_type(:uuid) }
    it { is_expected.to have_db_column(:thermostat_id).of_type(:uuid) }
    it { is_expected.to have_db_column(:temprature).of_type(:float) }
    it { is_expected.to have_db_column(:humidity).of_type(:float) }
    it { is_expected.to have_db_column(:battery_charge).of_type(:float) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:thermostat) }
  end

  describe 'valid' do
    it 'is valid with valid attributes' do
      expect(FactoryBot.create(:reading)).to be_valid
    end

    it 'is valid without temprature' do
      reading = FactoryBot.build(:reading, temprature: nil)
      expect(reading).to be_valid
    end

    it 'is valid without humidity' do
      reading = FactoryBot.build(:reading, humidity: nil)
      expect(reading).to be_valid
    end

    it 'is valid without battery_charge' do
      reading = FactoryBot.build(:reading, battery_charge: nil)
      expect(reading).to be_valid
    end
  end

  describe 'invalid' do
    it 'is invalid without household_token' do
      reading = FactoryBot.build(:reading, thermostat_id: nil)
      expect(reading).not_to be_valid
    end
  end
end
