# frozen_string_literal: true

# CREATE Thermostats

5.times do |i|
  Thermostat.create(
    household_token: JsonWebToken.encode({}),
    location: "house #{i} address"
  )
end
