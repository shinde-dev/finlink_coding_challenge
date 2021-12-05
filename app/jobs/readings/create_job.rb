# frozen_string_literal: true

module Readings
  class CreateJob < ApplicationJob
    queue_as :default

    def perform(params)
      reading = Reading.new(params)
      return if reading.save

      Rails.logger.error "Failed saving reading with parameters #{params}"
      # TODO: : Report error on error reporting tool like rollbar etc.
      # TODO:: Can use sidekiq retry mechanism but that depends after observing the error occurences.
    end
  end
end
