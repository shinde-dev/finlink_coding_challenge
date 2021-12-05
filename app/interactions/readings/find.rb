# frozen_string_literal: true

module Readings
  class Find < ActiveInteraction::Base
    string :id

    def execute
      reading = Reading.find_by(id: id)

      return reading if reading.present?

      # If reading is not present in DB then return from redis cache
      Reading.new(JSON.parse(REDIS.get(id))) || errors.add(:id, 'does not exist')
    end
  end
end
