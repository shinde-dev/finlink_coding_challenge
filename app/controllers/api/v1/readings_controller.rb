# frozen_string_literal: true

module Api
  module V1
    class ReadingsController < ApplicationController
      def create
        reading = Readings::Create.run(readings_params.merge!({ thermostat_id: current_thermostat.id }))

        if reading.valid?
          render_success_response('created', reading.result)
        else
          render_error_response(reading.errors.full_messages.to_sentence)
        end
      end

      def show
        reading = Readings::Find.run(params)

        if reading.valid?
          render_response('success', 200, reading.result)
        else
          render_not_found_response(reading.errors.full_messages.to_sentence)
        end
      end

      private

      def readings_params
        params.require(:readings).permit(:humidity, :number, :temprature, :battery_charge)
      end
    end
  end
end
