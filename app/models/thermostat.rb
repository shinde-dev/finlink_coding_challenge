# frozen_string_literal: true

class Thermostat < ApplicationRecord
  # associations
  has_many :readings, dependent: :nullify

  # validations
  validates :household_token, presence: true
end
