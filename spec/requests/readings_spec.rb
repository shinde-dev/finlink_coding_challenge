# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Readings', type: :request do
  let(:valid_headers) { { 'Authorization' => "Bearer #{FactoryBot.create(:thermostat).household_token}" } }

  describe 'POST /create' do
    let(:valid_attributes) do
      {
        humidity: 4.0,
        number: 1,
        temprature: 2.1,
        battery_charge: 0.7
      }
    end

    context 'with valid attributes' do
      it 'creates a new reading' do
        post api_v1_readings_url, params: { readings: valid_attributes }, headers: valid_headers, as: :json

        expect(response).to have_http_status(:created)
      end

      it 'creates a new reading without humidity' do
        post api_v1_readings_url,
             params: { readings: valid_attributes.merge!({ humidity: nil }) }, headers: valid_headers, as: :json

        expect(response).to have_http_status(:created)
      end

      it 'creates a new reading without number' do
        post api_v1_readings_url,
             params: { readings: valid_attributes.merge!({ number: nil }) }, headers: valid_headers, as: :json

        expect(response).to have_http_status(:created)
      end

      it 'creates a new reading without temprature' do
        post api_v1_readings_url,
             params: { readings: valid_attributes.merge!({ temprature: nil }) }, headers: valid_headers, as: :json

        expect(response).to have_http_status(:created)
      end

      it 'creates a new reading without battery_charge' do
        post api_v1_readings_url,
             params: { readings: valid_attributes.merge!({ battery_charge: nil }) }, headers: valid_headers, as: :json

        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid attributes' do
      it 'does not creates a new reading with nil token' do
        post api_v1_readings_url, params: { readings: valid_attributes }, headers: {}, as: :json

        expect(response).to have_http_status(:unauthorized)
      end

      it 'does not creates a new reading with invalid token' do
        post api_v1_readings_url,
             params: { readings: valid_attributes }, headers: { 'Authorization' => 'Bearer invalid' }, as: :json

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'GET /show' do
    let(:reading) { FactoryBot.create(:reading) }

    context 'with valid id' do
      it 'get a valid reading' do
        headers = { 'Authorization' => "Bearer #{reading.thermostat.household_token}" }
        get api_v1_reading_url(reading.id), headers: headers, as: :json
        json = JSON.parse(response.body)

        expect(response).to be_successful
        expect(json['id']).to eq(reading.id)
        expect(json['thermostat']['id']).to eq(reading.thermostat.id)
      end
    end

    context 'with invalid id' do
      it 'does not get a valid reading' do
        get api_v1_reading_url('invalid'), headers: valid_headers, as: :json
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'with invalid token' do
      it 'does not get a valid reading with nil token' do
        get api_v1_reading_url(reading.id), headers: {}, as: :json
        expect(response).to have_http_status(:unauthorized)
      end

      it 'does not get a valid reading with invalid token' do
        get api_v1_reading_url(reading.id), headers: { 'Authorization' => 'Bearer invalid' }, as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
