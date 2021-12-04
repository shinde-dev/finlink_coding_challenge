# frozen_string_literal: true

class Thermostat < ApplicationRecord
  validates :household_token, presence: true
end
