# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Readings::CreateJob, type: :job do
  describe '#perform_later' do
    it 'enqueue the job' do
      reading = FactoryBot.build(:reading)
      expect do
        described_class.perform_later(reading.attributes)
      end.to have_enqueued_job
    end
  end

  describe '#perform_now' do
    context 'with valid attributes' do
      it 'create the reading' do
        thermostat = FactoryBot.create(:thermostat)
        reading = FactoryBot.build(:reading, thermostat_id: thermostat.id)
        expect do
          described_class.perform_now(reading.attributes)
        end.to change(Reading, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not create the reading' do
        expect do
          described_class.perform_now({})
        end.not_to change(Reading, :count)
      end
    end
  end
end
