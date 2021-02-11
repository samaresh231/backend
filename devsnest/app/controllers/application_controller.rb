# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ApiRenderConcern
  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end

  def bot_authorization
    bot_token = request.headers["Authorization"]
    return render_forbidden if bot_token != ENV['DISCORD_TOKEN']
  end
end
