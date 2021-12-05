# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReadingSerializer, type: :serializers do
  describe 'ReadingSerializer' do
    context 'with valid object' do
      it 'returns valid attributes' do
        reading = FactoryBot.create(:reading)
        serializer = described_class.new(reading)
        object_hash = serializer.serializable_hash

        expect(object_hash[:id]).to eq(reading.id)
        expect(object_hash[:number]).to eq(reading.number)
        expect(object_hash[:temprature]).to eq(reading.temprature)
        expect(object_hash[:humidity]).to eq(reading.humidity)
        expect(object_hash[:battery_charge]).to eq(reading.battery_charge)

        # Themostat
        expect(object_hash[:thermostat][:id]).to eq(reading.thermostat.id)
        expect(object_hash[:thermostat][:location]).to eq(reading.thermostat.location)

        # Should not return household_token
        expect(object_hash[:thermostat][:household_token]).to eq(nil)
      end
    end
  end
end
