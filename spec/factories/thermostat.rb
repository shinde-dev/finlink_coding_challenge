# frozen_string_literal: true

FactoryBot.define do
  factory :thermostat do
    household_token { JsonWebToken.encode({}) }
    location { 'house 1 address' }
  end
end
