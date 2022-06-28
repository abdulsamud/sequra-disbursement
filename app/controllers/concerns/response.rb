# frozen_string_literal: true

module Response
  extend ActiveSupport::Concern

  # Render JSON for success response with status 200
  def render_success_response(data = nil)
    render json: { data: data }, status: :ok
  end

  # Render JSON for error response with status
  def render_error_response(message, status)
    render json: { message: message }, status: status
  end
end
