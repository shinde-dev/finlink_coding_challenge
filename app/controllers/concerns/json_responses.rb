# frozen_string_literal: true

module JsonResponses
  extend ActiveSupport::Concern

  private

  def render_error_response(message, data = {})
    render_response(message, :bad_request, data)
  end

  def render_success_response(message, serializer, data = {})
    render_response(message, :created, data, serializer)
  end

  def render_not_found_response(message)
    render_response(message, :not_found)
  end

  def render_response(message, code, data, serializer)
    render json: data, message: message, status: code, serializer: serializer
  end
end
