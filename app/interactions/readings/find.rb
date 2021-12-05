# frozen_string_literal: true

module Readings
  class Find < ActiveInteraction::Base
    string :id

    def execute
      reading = Reading.find_by(id: id)

      reading || errors.add(:id, 'does not exist')
    end
  end
end
