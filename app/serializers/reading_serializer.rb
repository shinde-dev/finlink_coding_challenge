# frozen_string_literal: true

class ReadingSerializer < ActiveModel::Serializer
  attributes :id, :number, :temprature, :humidity, :battery_charge

  belongs_to :thermostat
end
