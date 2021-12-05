# frozen_string_literal: true

module Readings
  class Find < ActiveInteraction::Base
    string :id

    def execute
      reading = Reading.find_by(id: id)
      return reading if reading.present?

      # If reading is not present in DB then return from redis cache
      reading = JSON.parse(REDIS.get(id))
      Reading.new(reading)
    rescue StandardError => e
      Rails.logger.error "Error in find reading with id #{id} due to error #{e.message}}"
      errors.add(:id, 'does not exist')
    end
  end
end
