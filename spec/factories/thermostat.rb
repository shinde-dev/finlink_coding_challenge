# frozen_string_literal: true

FactoryBot.define do
  factory :thermostat do
    household_token { 'random_token' }
    location { 'house 1 address' }
  end
end
