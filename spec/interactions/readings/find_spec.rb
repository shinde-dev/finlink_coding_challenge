# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Readings::Find, type: :interactions do
  describe 'Find Readings' do
    let(:reading) { FactoryBot.create(:reading) }

    context 'with valid id' do
      it 'returns reading' do
        expect(described_class.run(id: reading.id).result).to eq(reading)
      end
    end

    context 'with invalid id' do
      it 'returns error' do
        reading = described_class.run(id: 'invalid')
        expect(reading.errors.full_messages.to_sentence).to eq('Id does not exist')
      end
    end
  end
end
