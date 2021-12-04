# frozen_string_literal: true

FactoryBot.define do
  factory :reading do
    thermostat
    number { 2 }
    temprature { 4.8 }
    humidity { 2.4 }
    battery_charge { 0.5 }
  end
end
