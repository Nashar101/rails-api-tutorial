class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private
  def not_found(error)
    render json: { error: error.record.errors 0}, status: :not_found
  end
end
