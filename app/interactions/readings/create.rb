# frozen_string_literal: true

module Readings
  class Create < ActiveInteraction::Base
    float :temprature, :humidity, :battery_charge, default: nil
    integer :number, default: nil
    string :thermostat_id

    validates :thermostat_id, presence: true

    def to_model
      Reading.new
    end

    def execute
      reading = Reading.new(inputs)

      errors.merge!(reading.errors) unless reading.save

      reading
    end
  end
end
