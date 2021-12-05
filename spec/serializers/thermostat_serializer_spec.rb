# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ThermostatSerializer, type: :serializers do
  describe 'ThermostatSerializer' do
    context 'with valid object' do
      it 'returns valid attributes' do
        thermostat = FactoryBot.create(:thermostat)
        serializer = described_class.new(thermostat)
        object_hash = serializer.serializable_hash

        expect(object_hash[:id]).to eq(thermostat.id)
        expect(object_hash[:location]).to eq(thermostat.location)

        # Should not return household_token
        expect(object_hash[:household_token]).to eq(nil)
      end
    end
  end
end
