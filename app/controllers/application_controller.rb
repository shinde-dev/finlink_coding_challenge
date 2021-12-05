# frozen_string_literal: true

class ApplicationController < ActionController::API
  include JsonResponses
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :require_valid_token

  private

  def current_thermostat
    @current_thermostat ||= Thermostat.find_by(household_token: @token)
  end

  def require_valid_token
    render_unauthorised unless authenticate
  end

  def authenticate
    authenticate_with_http_token do |token, _options|
      return nil unless JsonWebToken.decode(token)

      @token = token
    end
  rescue StandardError => e
    Rails.logger.error "Error while authentication token #{request.headers['Authorization']} #{e.message}"
    nil
  end

  def render_unauthorised
    render(json: { status: 'fail', message: 'Bad credentials' }, status: :unauthorized)
  end
end
