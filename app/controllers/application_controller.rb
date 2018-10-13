class ApplicationController < ActionController::Base
  include JSONAPI::Utils
  
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def render_not_found_response( exception )
    render json: { errors: [{ title: "Record not found",
                              detail: exception.message,
                              code: "404",
                              status: "404" }]}, status: :not_found
  end
end
