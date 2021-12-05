# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Readings::Create, type: :interactions do
  describe 'Create Readings' do
    let(:attributes)  do
      {
        humidity: 4.0,
        number: 1,
        temprature: 2.1,
        battery_charge: 0.7
      }
    end

    context 'with valid attributes' do
      it 'returns reading object' do
        expect(described_class.new.to_model.class).to eq(Reading)
      end

      it 'returns reading from cache' do
        thermostat = FactoryBot.create(:thermostat)
        reading = described_class.run(attributes.merge!({ thermostat_id: thermostat.id }))
        new_reading = JSON.parse(REDIS.get(reading.result.id))
        expect(new_reading['id']).to eq(reading.result.id)
      end
    end

    context 'with invalid attributes' do
      it 'returns error without thermostat id' do
        reading = described_class.run(attributes)
        expect(reading.errors.full_messages.to_sentence).to eq('Thermostat is required')
      end
    end
  end
end
